name :
	 Cairo
homepage :
	 https://cairographics.org/
url :
	 https://cairographics.org/releases/cairo-1.16.0.tar.xz
description :
	 Vector graphics library with cross-device output support
build_deps :
	 pkg-config
link_deps :
	 fontconfig
	 freetype
	 glib
	 libpng
	 pixman
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 ENV["NOCONFIGURE"] = "1"
	 system "./autogen.sh"
