name :
	 Duc
homepage :
	 https://duc.zevv.nl/
url :
	 https://github.com/zevv/duc/releases/download/1.4.4/duc-1.4.4.tar.gz
description :
	 Suite of tools for inspecting disk usage
build_deps :
	 pkg-config
link_deps :
	 cairo
	 glfw
	 pango
	 tokyo-cabinet
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-x11",
	 "--enable-opengl"
	 system "make", "install"
