name :
	 Gkrellm
homepage :
	 https://billw2.github.io/gkrellm/gkrellm.html
url :
	 http://gkrellm.srcbox.net/releases/gkrellm-2.3.10.tar.bz2
description :
	 Extensible GTK system monitoring application
build_deps :
	 pkg-config
link_deps :
	 atk
	 cairo
	 fontconfig
	 freetype
	 gdk-pixbuf
	 gettext
	 glib
	 gtk+
	 openssl
	 pango
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "INSTALLROOT=#{prefix}", "macosx"
	 system "make", "INSTALLROOT=#{prefix}", "install"
