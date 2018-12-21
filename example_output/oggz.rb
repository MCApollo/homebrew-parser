name :
	 Oggz
homepage :
	 https://www.xiph.org/oggz/
url :
	 https://downloads.xiph.org/releases/liboggz/liboggz-1.1.1.tar.gz
description :
	 Command-line tool for manipulating Ogg files
build_deps :
	 pkg-config
link_deps :
	 libogg
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-dependency-tracking"
	 system "make", "install"
