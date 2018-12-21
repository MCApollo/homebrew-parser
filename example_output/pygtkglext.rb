name :
	 Pygtkglext
homepage :
	 https://projects.gnome.org/gtkglext/download.html#pygtkglext
url :
	 https://download.gnome.org/sources/pygtkglext/1.1/pygtkglext-1.1.0.tar.gz
description :
	 Python bindings to OpenGL GTK+ extension
build_deps :
	 pkg-config
link_deps :
	 gtkglext
	 pygobject
	 pygtk
conflicts :
patches :
EOF_patch :
install :
	 inreplace "gtk/gdkgl/gdkglext.override", "#include <GL/gl.h>", "#include <gl.h>"
	 ENV["PYGTK_CODEGEN"] = "#{Formula["pygobject"].opt_bin}/pygobject-codegen-2.0"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
