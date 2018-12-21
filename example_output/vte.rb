name :
	 Vte
homepage :
	 https://developer.gnome.org/vte/
url :
	 https://download.gnome.org/sources/vte/0.28/vte-0.28.2.tar.xz
description :
	 Terminal emulator widget used by GNOME terminal
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 glib
	 gtk+
	 pygobject
	 pygtk
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-Bsymbolic
	 --enable-python
	 ]
	 ENV["PYGTK_CODEGEN"] = Formula["pygobject"].bin/"pygobject-codegen-2.0"
	 system "./configure", *args
	 system "make", "install"
