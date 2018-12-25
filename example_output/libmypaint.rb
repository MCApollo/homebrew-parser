name :
	 Libmypaint
homepage :
	 https://github.com/mypaint/libmypaint/wiki
url :
	 https://github.com/mypaint/libmypaint/releases/download/v1.3.0/libmypaint-1.3.0.tar.xz
description :
	 MyPaint brush engine library
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 json-c
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-introspection",
	 "--without-glib",
	 "--prefix=#{prefix}"
	 system "make", "install"
