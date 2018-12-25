name :
	 Liblunar
homepage :
	 https://code.google.com/archive/p/liblunar/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/liblunar/liblunar-2.2.5.tar.gz
description :
	 Lunar date calendar
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
