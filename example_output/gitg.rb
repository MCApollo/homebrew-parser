name :
	 Gitg
homepage :
	 https://wiki.gnome.org/Apps/Gitg
url :
	 https://download.gnome.org/sources/gitg/3.30/gitg-3.30.0.tar.xz
description :
	 GNOME GUI client to view git repositories
build_deps :
	 intltool
	 meson-internal
	 ninja
	 pkg-config
	 vala
link_deps :
	 adwaita-icon-theme
	 gobject-introspection
	 gtk+3
	 gtksourceview3
	 gtkspell3
	 hicolor-icon-theme
	 libgee
	 libgit2
	 libgit2-glib
	 libpeas
	 libsecret
	 libsoup
conflicts :
patches :
EOF_patch :
	 diff --git a/libgitg/meson.build b/libgitg/meson.build
	 index 793f2c2..fbc42da 100644
	 --- a/libgitg/meson.build
	 +++ b/libgitg/meson.build
	 @@ -114,14 +114,13 @@ if gdk_targets.contains('quartz')
	 sources += files('gitg-platform-support-osx.c')
	 gio_system_pkg = 'gio-unix-2.0'
	 deps += [
	 -    dependency(gio_system_pkg),
	 -    find_library('objc')
	 +    dependency(gio_system_pkg)
	 ]
	 cflags += '-xobjective-c'
	 foreach test_ldflag: test_ldflags
	 -  if cc.has_argument(test_ldflag)
	 ldflags += test_ldflag
	 -  endif
	 libgitg = shared_library(
	 diff --git a/meson.build b/meson.build
	 index 0790c5e..61c7417 100644
	 --- a/meson.build
	 +++ b/meson.build
	 @@ -79,11 +79,9 @@ endif
	 if gitg_debug
install :
	 ENV["DESTDIR"] = "/"
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", "-Dpython=false", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"