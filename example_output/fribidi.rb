name :
	 Fribidi
homepage :
	 https://github.com/fribidi/fribidi
url :
	 https://github.com/fribidi/fribidi/releases/download/v1.0.5/fribidi-1.0.5.tar.bz2
description :
	 Implementation of the Unicode BiDi algorithm
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--enable-static"
	 system "make", "install"
