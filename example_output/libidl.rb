name :
	 Libidl
homepage :
	 https://ftp.acc.umu.se/pub/gnome/sources/libIDL/0.8/
url :
	 https://download.gnome.org/sources/libIDL/0.8/libIDL-0.8.14.tar.bz2
description :
	 Library for creating CORBA IDL files
build_deps :
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
