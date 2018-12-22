name :
	 Xrootd
homepage :
	 http://xrootd.org
url :
	 http://xrootd.org/download/v4.8.3/xrootd-4.8.3.tar.gz
description :
	 High performance, scalable, fault-tolerant access to data
build_deps :
	 cmake
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
