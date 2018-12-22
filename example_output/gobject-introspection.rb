name :
	 GobjectIntrospection
homepage :
	 https://wiki.gnome.org/Projects/GObjectIntrospection
url :
	 https://download.gnome.org/sources/gobject-introspection/1.58/gobject-introspection-1.58.2.tar.xz
description :
	 Generate introspection data for GObject libraries
build_deps :
link_deps :
	 cairo
	 glib
	 libffi
	 pkg-config
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV["GI_SCANNER_DISABLE_CACHE"] = "true"
	 inreplace "giscanner/transformer.py", "/usr/share", "#{HOMEBREW_PREFIX}/share"
	 inreplace "configure" do |s|
	 s.change_make_var! "GOBJECT_INTROSPECTION_LIBDIR", "#{HOMEBREW_PREFIX}/lib"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-python=#{Formula["python@2"].opt_bin}/python2"
	 system "make"
	 system "make", "install"
