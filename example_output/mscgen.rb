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
optional_deps :
	 :x11
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-freetype",
	 "--disable-dependency-tracking"
	 system "make", "install"
