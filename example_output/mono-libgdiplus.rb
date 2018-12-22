name :
	 MonoLibgdiplus
homepage :
	 https://www.mono-project.com/docs/gui/libgdiplus/
url :
	 https://github.com/mono/libgdiplus/archive/5.6.tar.gz
description :
	 GDI+-compatible API on non-Windows operating systems
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 cairo
	 fontconfig
	 freetype
	 gettext
	 giflib
	 glib
	 jpeg
	 libexif
	 libpng
	 libtiff
	 pixman
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--without-x11",
	 "--disable-tests",
	 "--prefix=#{prefix}"
	 system "make"
	 cd "tests" do
	 system "make", "testbits"
	 system "./testbits"
	 end
	 system "make", "install"
