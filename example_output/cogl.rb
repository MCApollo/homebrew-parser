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
optional_deps :
conflicts :
resource :
	 ['grep']
	 ['https://ftp.gnu.org/gnu/grep/grep-2.20.tar.xz']
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
	 end
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --enable-cogl-pango=yes
	 --enable-introspection=yes
	 --disable-glx
	 --without-x
	 ]
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
	 doc.install "examples"
