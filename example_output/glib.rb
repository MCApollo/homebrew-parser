name :
	 Glib
homepage :
	 https://developer.gnome.org/glib/
url :
	 https://download.gnome.org/sources/glib/2.58/glib-2.58.1.tar.xz
description :
	 Core application library for C
build_deps :
	 autoconf
	 automake
	 gtk-doc
	 libtool
	 pkg-config
link_deps :
	 gettext
	 libffi
	 pcre
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/59e4d32/glib/hardcoded-paths.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/5857984/glib/revert-appinfo-contenttype.patch
EOF_patch :
install :
	 inreplace %w[gio/gdbusprivate.c gio/xdgmime/xdgmime.c glib/gutils.c],
	 "@@HOMEBREW_PREFIX@@", HOMEBREW_PREFIX
	 args = %W[
	 --disable-maintainer-mode
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --disable-dtrace
	 --disable-libelf
	 --enable-static
	 --prefix=#{prefix}
	 --localstatedir=#{var}
	 --with-gio-module-dir=#{HOMEBREW_PREFIX}/lib/gio/modules
	 ]
	 ENV["NOCONFIGURE"] = "1"
	 system "./autogen.sh"
	 system "./configure", *args
	 inreplace "gio/Makefile",
	 "$(mkinstalldirs) $(DESTDIR)$(GIO_MODULE_DIR)",
	 ""
	 inreplace "gio-2.0.pc",
	 "giomoduledir=#{HOMEBREW_PREFIX}/lib/gio/modules",
	 "giomoduledir=${prefix}/lib/gio/modules"
	 system "make"
	 system "make", "install"
	 gettext = Formula["gettext"].opt_prefix
	 inreplace lib+"pkgconfig/glib-2.0.pc" do |s|
	 s.gsub! "Libs: -L${libdir} -lglib-2.0 -lintl",
	 "Libs: -L${libdir} -lglib-2.0 -L#{gettext}/lib -lintl"
	 s.gsub! "Cflags: -I${includedir}/glib-2.0 -I${libdir}/glib-2.0/include",
	 "Cflags: -I${includedir}/glib-2.0 -I${libdir}/glib-2.0/include -I#{gettext}/include"
	 end
	 (HOMEBREW_PREFIX/"lib/gio/modules").mkpath
