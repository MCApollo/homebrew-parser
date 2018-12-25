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
optional_deps :
conflicts :
resource :
	 ['MarkupSafe', 'Jinja2', 'third-party', 'aws-sdk-cpp']
	 ['https://files.pythonhosted.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz', 'https://files.pythonhosted.org/packages/5f/bd/5815d4d925a2b8cbbb4b4960f018441b0c65f24ba29f3bdcfb3c8218a307/Jinja2-2.8.1.tar.gz', 'https://github.com/osquery/third-party/archive/3.0.0.tar.gz', 'https://github.com/aws/aws-sdk-cpp/archive/1.3.30.tar.gz']
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
