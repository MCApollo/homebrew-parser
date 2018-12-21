name :
	 Mscgen
homepage :
	 http://www.mcternan.me.uk/mscgen/
url :
	 http://www.mcternan.me.uk/mscgen/software/mscgen-src-0.20.tar.gz
description :
	 Parses Message Sequence Chart descriptions and produces images
build_deps :
	 pkg-config
link_deps :
	 freetype
	 gd
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-freetype",
	 "--disable-dependency-tracking"
	 system "make", "install"
