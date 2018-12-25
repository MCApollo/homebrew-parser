name :
	 Pygtk
homepage :
	 http://www.pygtk.org/
url :
	 https://download.gnome.org/sources/pygtk/2.24/pygtk-2.24.0.tar.bz2
description :
	 GTK+ bindings for Python
build_deps :
	 pkg-config
link_deps :
	 atk
	 glib
	 gtk+
	 py2cairo
	 pygobject
optional_deps :
	 libglade
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "-ObjC"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 inreplace lib/"pkgconfig/pygtk-2.0.pc", "codegendir=${datadir}/pygobject/2.0/codegen", "codegendir=#{HOMEBREW_PREFIX}/share/pygobject/2.0/codegen"
	 inreplace bin/"pygtk-codegen-2.0", "exec_prefix=${prefix}", "exec_prefix=#{Formula["pygobject"].opt_prefix}"
