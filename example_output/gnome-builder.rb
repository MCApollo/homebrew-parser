name :
	 GnomeBuilder
homepage :
	 https://wiki.gnome.org/Apps/Builder
url :
	 https://download.gnome.org/sources/gnome-builder/3.28/gnome-builder-3.28.4.tar.xz
description :
	 IDE for GNOME
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
	 python
link_deps :
	 adwaita-icon-theme
	 dbus
	 gspell
	 gtk+3
	 gtksourceview3
	 hicolor-icon-theme
	 json-glib
	 jsonrpc-glib
	 libdazzle
	 libgit2-glib
	 libpeas
	 libxml2
	 template-glib
	 vte3
conflicts :
patches :
EOF_patch :
	 diff --git a/src/libide/meson.build b/src/libide/meson.build
	 index 055801b..4e29f9d 100644
	 --- a/src/libide/meson.build
	 +++ b/src/libide/meson.build
	 @@ -160,37 +160,6 @@ if get_option('with_editorconfig')
	 ]
	 endif
	 -
	 -python3 = find_program('python3')
	 -
	 -get_overridedir = '''
	 -import os
	 -import sysconfig
	 -
	 -libdir = sysconfig.get_config_var('LIBDIR')
	 -if not libdir:
	 -  libdir = '/usr/lib'
	 -
	 -try:
	 -  import gi
	 -  overridedir = gi._overridesdir
	 -except ImportError:
	 -  purelibdir = sysconfig.get_path('purelib')
	 -  overridedir = os.path.join(purelibdir, 'gi', 'overrides')
	 -
	 -if overridedir.startswith(libdir):
	 -  overridedir = overridedir[len(libdir) + 1:]
	 -
	 -print(overridedir)
	 -'''
	 -
	 -ret = run_command([python3, '-c', get_overridedir])
	 -if ret.returncode() != 0
	 -  error('Failed to determine pygobject overridedir')
	 -else
	 -  pygobject_override_dir = join_paths(get_option('libdir'), ret.stdout().strip())
	 -endif
	 -
	 install_data('Ide.py', install_dir: pygobject_override_dir)
	 libide_deps = [
	 diff --git a/src/plugins/meson.build b/src/plugins/meson.build
	 index d97d7e3..646e7f3 100644
	 --- a/src/plugins/meson.build
	 +++ b/src/plugins/meson.build
	 @@ -5,10 +5,8 @@ gnome_builder_plugins_sources = ['gnome-builder-plugins.c']
	 gnome_builder_plugins_args = []
	 gnome_builder_plugins_deps = [libpeas_dep, libide_plugin_dep, libide_dep]
	 gnome_builder_plugins_link_with = []
	 -gnome_builder_plugins_link_deps = join_paths(meson.current_source_dir(), 'plugins.map')
	 -gnome_builder_plugins_link_args = [
	 -  '-Wl,--version-script,' + gnome_builder_plugins_link_deps,
	 -]
	 +gnome_builder_plugins_link_deps = []
	 +gnome_builder_plugins_link_args = []
	 subdir('autotools')
	 subdir('autotools-templates')
	 @@ -76,7 +74,6 @@ gnome_builder_plugins = shared_library(
	 gnome_builder_plugins_sources,
	 dependencies: gnome_builder_plugins_deps,
	 -   link_depends: 'plugins.map',
	 c_args: gnome_builder_plugins_args,
	 link_args: gnome_builder_plugins_link_args,
	 link_with: gnome_builder_plugins_link_with,
	 diff --git a/src/main.c b/src/main.c
	 index f3bea6d..8f7eab8 100644
	 --- a/src/main.c
	 +++ b/src/main.c
	 @@ -109,6 +109,9 @@ main (int   argc,
	 /* Setup our gdb fork()/exec() helper */
	 bug_buddy_init ();
	 +  /* macOS dbus hack */
	 +  g_setenv("DBUS_SESSION_BUS_ADDRESS", "launchd:env=DBUS_LAUNCHD_SESSION_BUS_SOCKET", TRUE);
	 +
	 /*
	 * We require a desktop session that provides a properly working
	 * DBus environment. Bail if for some reason that is not the case.
install :
	 ENV.cxx11
	 ENV["DESTDIR"] = ""
	 args = %W[
	 --prefix=#{prefix}
	 -Dwith_git=true
	 -Dwith_autotools=true
	 -Dwith_history=true
	 -Dwith_webkit=false
	 -Dwith_clang=false
	 -Dwith_devhelp=false
	 -Dwith_flatpak=false
	 -Dwith_sysprof=false
	 -Dwith_vapi=false
	 -Dwith_vala_pack=false
	 -Dwith_qemu=false
	 -Dwith_safe_path=#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin
	 ]
	 pyver = Language::Python.major_minor_version "python3"
	 inreplace "src/libide/meson.build",
	 "install_dir: pygobject_override_dir",
	 "install_dir: '#{lib}/python#{pyver}/site-packages'"
	 mkdir "build" do
	 system "meson", *args, ".."
	 system "ninja"
	 system "ninja", "install"
	 end
	 ln_s Dir.glob("#{lib}/gnome-builder/*dylib"), lib
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
