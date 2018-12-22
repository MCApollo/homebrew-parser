name :
	 Cogl
homepage :
	 https://developer.gnome.org/cogl/
url :
	 https://download.gnome.org/sources/cogl/1.22/cogl-1.22.2.tar.xz
description :
	 Low level OpenGL abstraction library developed for Clutter
build_deps :
	 gobject-introspection
	 pkg-config
link_deps :
	 cairo
	 glib
	 gtk-doc
	 pango
conflicts :
patches :
EOF_patch :
install :
	 ENV["GI_SCANNER_DISABLE_CACHE"] = "yes"
	 if MacOS.version == :lion
	 resource("grep").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-nls",
	 "--prefix=#{buildpath}/grep"
	 system "make", "install"
	 ENV["GREP"] = "#{buildpath}/grep/bin/grep"
	 end
