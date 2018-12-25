name :
	 Gtkspell3
homepage :
	 https://gtkspell.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gtkspell/3.0.10/gtkspell3-3.0.10.tar.xz
description :
	 Gtk widget for highlighting and replacing misspelled words
build_deps :
	 autoconf
	 automake
	 gobject-introspection
	 intltool
	 libtool
	 pkg-config
	 vala
link_deps :
	 enchant
	 gtk+3
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fi"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-debug",
	 "--enable-vala",
	 "--prefix=#{prefix}"
	 system "make", "install"
