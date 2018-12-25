name :
	 Gtkx
homepage :
	 https://gtk.org/
url :
	 https://download.gnome.org/sources/gtk+/2.24/gtk+-2.24.32.tar.xz
description :
	 GUI toolkit
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 atk
	 gdk-pixbuf
	 hicolor-icon-theme
	 pango
optional_deps :
	 jasper
conflicts :
resource :
	 []
	 []
patches :
	 https://bug757187.bugzilla-attachments.gnome.org/attachment.cgi?id=331173
EOF_patch :
install :
	 args = ["--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-glibtest",
	 "--enable-introspection=yes",
	 "--with-gdktarget=quartz",
	 "--disable-visibility"]
	 if build.head?
	 inreplace "autogen.sh", "libtoolize", "glibtoolize"
	 ENV["NOCONFIGURE"] = "yes"
	 system "./autogen.sh"
	 end
	 system "./configure", *args
	 system "make", "install"
	 inreplace bin/"gtk-builder-convert", %r{^#!/usr/bin/env python$}, "#!/usr/bin/python"
