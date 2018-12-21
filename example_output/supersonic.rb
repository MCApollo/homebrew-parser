name :
	 Supersonic
homepage :
	 https://code.google.com/archive/p/supersonic/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/supersonic/supersonic-0.9.4.tar.gz
description :
	 C++ library providing a column oriented query engine
build_deps :
	 pkg-config
link_deps :
	 boost
	 gflags
	 glog
	 protobuf
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV["GFLAGS_CFLAGS"] = "-I#{Formula["gflags"].opt_include}"
	 ENV["GFLAGS_LIBS"] = "-L#{Formula["gflags"].opt_lib} -lgflags"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-re2"
	 system "make", "clean"
	 system "make", "install"
