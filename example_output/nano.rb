name :
	 Nano
homepage :
	 https://www.nano-editor.org/
url :
	 https://nano-editor.org/dist/v3/nano-3.2.tar.gz
description :
	 Free (GNU) replacement for the Pico text editor
build_deps :
	 pkg-config
link_deps :
	 gettext
	 ncurses
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--enable-color",
	 "--enable-extra",
	 "--enable-multibuffer",
	 "--enable-nanorc",
	 "--enable-utf8"
	 system "make", "install"
	 doc.install "doc/sample.nanorc"
