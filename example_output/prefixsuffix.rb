name :
	 Prefixsuffix
homepage :
	 https://github.com/murraycu/prefixsuffix
url :
	 https://download.gnome.org/sources/prefixsuffix/0.6/prefixsuffix-0.6.9.tar.xz
description :
	 GUI batch renaming utility
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gtkmm3
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-schemas-compile"
	 system "make", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
