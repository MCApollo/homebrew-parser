name :
	 Typespeed
homepage :
	 https://typespeed.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/typespeed/typespeed/0.6.5/typespeed-0.6.5.tar.gz
description :
	 Zap words flying across the screen by typing them correctly
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
	 inreplace "src/Makefile.in", "gcc", ENV.cc
	 inreplace "testsuite/Makefile.in", "gcc", ENV.cc
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
