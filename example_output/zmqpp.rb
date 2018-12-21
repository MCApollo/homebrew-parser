name :
	 Zmqpp
homepage :
	 https://zeromq.github.io/zmqpp/
url :
	 https://github.com/zeromq/zmqpp/archive/4.2.0.tar.gz
description :
	 High-level C++ binding for zeromq
build_deps :
	 doxygen
link_deps :
	 zeromq
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"
	 system "doxygen"
	 (doc/"html").install Dir["docs/html/*.html"]
