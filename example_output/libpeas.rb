name :
	 Libpeas
homepage :
	 https://developer.gnome.org/libpeas/stable/
url :
	 https://download.gnome.org/sources/libpeas/1.22/libpeas-1.22.0.tar.xz
description :
	 GObject plugin library
build_deps :
	 gettext
	 intltool
	 pkg-config
link_deps :
	 glib
	 gobject-introspection
	 gtk+3
	 pygobject3
	 python
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --enable-gtk
	 --enable-python3
	 --disable-python2
	 ]
	 xy = Language::Python.major_minor_version "python3"
	 py3_lib = Formula["python"].opt_frameworks/"Python.framework/Versions/#{xy}/lib"
	 ENV.append "LDFLAGS", "-L#{py3_lib}"
	 system "./configure", *args
	 system "make", "install"
