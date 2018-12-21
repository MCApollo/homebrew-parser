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
