name :
	 Pygobject
homepage :
	 https://wiki.gnome.org/Projects/PyGObject
url :
	 https://download.gnome.org/sources/pygobject/2.28/pygobject-2.28.7.tar.xz
description :
	 GLib/GObject/GIO Python bindings for Python 2
build_deps :
	 pkg-config
link_deps :
	 glib
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-introspection"
	 system "make", "install"
	 (lib/"python2.7/site-packages/pygtk.pth").append_lines <<~EOS
	 #{HOMEBREW_PREFIX}/lib/python2.7/site-packages/gtk-2.0
	 EOS
