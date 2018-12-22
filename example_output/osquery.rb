name :
	 Osquery
homepage :
	 https://osquery.io
url :
	 https://github.com/facebook/osquery/archive/3.3.0.tar.gz
description :
	 SQL powered operating system instrumentation and analytics
build_deps :
	 bison
	 cmake
	 python@2
link_deps :
	 augeas
	 boost
	 gflags
	 glog
	 libarchive
	 libmagic
	 librdkafka
	 lldpd
	 :macos
	 openssl
	 rapidjson
	 rocksdb
	 sleuthkit
	 ssdeep
	 thrift
	 xz
	 yara
	 zstd
conflicts :
patches :
	 https://github.com/facebook/osquery/commit/512f775c.diff?full_index=1
EOF_patch :
install :
	 ENV.cxx11
	 vendor = buildpath/"brew_vendor"
	 resource("aws-sdk-cpp").stage do
	 args = std_cmake_args + %W[
	 -DSTATIC_LINKING=1
	 -DNO_HTTP_CLIENT=1
	 -DMINIMIZE_SIZE=ON
	 -DBUILD_SHARED_LIBS=OFF
	 -DBUILD_ONLY=ec2;firehose;kinesis;sts
	 -DCMAKE_INSTALL_PREFIX=#{vendor}/aws-sdk-cpp
	 ]
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make"
	 system "make", "install"
	 end
	 end
	 ENV["SKIP_TESTS"] = "1"
	 ENV["SKIP_DEPS"] = "1"
	 ENV["SKIP_SMART"] = "1"
	 ENV["BUILD_LINK_SHARED"] = "1"
	 ENV["OSQUERY_BUILD_VERSION"] = version
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"third-party/python/lib/python2.7/site-packages"
	 res = resources.map(&:name).to_set - %w[aws-sdk-cpp third-party]
	 res.each do |r|
	 resource(r).stage do
	 system "python", "setup.py", "install",
	 "--prefix=#{buildpath}/third-party/python/",
	 "--single-version-externally-managed",
	 "--record=installed.txt"
	 end
	 end
	 cxx_flags_release = %W[
	 -DNDEBUG
	 -I#{MacOS.sdk_path}/usr/include/libxml2
	 -I#{vendor}/aws-sdk-cpp/include
	 ]
	 args = std_cmake_args + %W[
	 -Daws-cpp-sdk-core_library:FILEPATH=#{vendor}/aws-sdk-cpp/lib/libaws-cpp-sdk-core.a
	 -Daws-cpp-sdk-firehose_library:FILEPATH=#{vendor}/aws-sdk-cpp/lib/libaws-cpp-sdk-firehose.a
	 -Daws-cpp-sdk-kinesis_library:FILEPATH=#{vendor}/aws-sdk-cpp/lib/libaws-cpp-sdk-kinesis.a
	 -Daws-cpp-sdk-sts_library:FILEPATH=#{vendor}/aws-sdk-cpp/lib/libaws-cpp-sdk-sts.a
	 -DCMAKE_CXX_FLAGS_RELEASE:STRING=#{cxx_flags_release.join(" ")}
	 ]
	 (buildpath/"third-party").install resource("third-party")
	 system "cmake", ".", *args
	 system "make"
	 system "make", "install"
	 (include/"osquery/core").install Dir["osquery/core/*.h"]
