name :
	 Paps
homepage :
	 https://github.com/dov/paps
url :
	 https://github.com/dov/paps/archive/0.7.0.tar.gz
description :
	 Pango to PostScript converter
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 fontconfig
	 freetype
	 gettext
	 glib
	 pango
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 pkgshare.install "examples"
