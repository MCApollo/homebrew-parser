name :
	 Libchewing
homepage :
	 http://chewing.im/
url :
	 https://github.com/chewing/libchewing/releases/download/v0.5.1/libchewing-0.5.1.tar.bz2
description :
	 Intelligent phonetic input method library
build_deps :
	 texinfo
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
