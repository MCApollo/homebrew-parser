name :
	 Libcello
homepage :
	 http://libcello.org/
url :
	 http://libcello.org/static/libCello-2.1.0.tar.gz
description :
	 Higher-level programming in C
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "check"
	 system "make", "install", "PREFIX=#{prefix}"
