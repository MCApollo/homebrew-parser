name :
	 Gtkglext
homepage :
	 https://projects.gnome.org/gtkglext/
url :
	 https://download.gnome.org/sources/gtkglext/1.2/gtkglext-1.2.0.tar.gz
description :
	 OpenGL extension to GTK+
build_deps :
	 pkg-config
link_deps :
	 glib
	 gtk+
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/21e7e01/gtkglext/patch-configure.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/21e7e01/gtkglext/patch-examples-pixmap-mixed.c.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/21e7e01/gtkglext/patch-examples-pixmap.c.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/21e7e01/gtkglext/patch-gdk-gdkglglext.h.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/21e7e01/gtkglext/patch-gdk-gdkglquery.c.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/21e7e01/gtkglext/patch-gdk-gdkglshapes.c.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/21e7e01/gtkglext/patch-gdk-makefile.in.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/21e7e01/gtkglext/patch-gtk-gtkglwidget.c.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/21e7e01/gtkglext/patch-gtk-makefile.in.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/21e7e01/gtkglext/patch-makefile.in.diff
	 https://trac.macports.org/raw-attachment/ticket/56260/patch-index-gdkglshapes-osx.diff
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-x"
	 system "make", "install"
