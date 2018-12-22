name :
	 Gom
homepage :
	 https://wiki.gnome.org/Projects/Gom
url :
	 https://download.gnome.org/sources/gom/0.3/gom-0.3.3.tar.xz
description :
	 GObject wrapper around SQLite
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
	 python
link_deps :
	 gdk-pixbuf
	 gettext
	 glib
conflicts :
patches :
EOF_patch :
	 diff --git a/bindings/python/meson.build b/bindings/python/meson.build
	 index feb4a9c..2fda8c1 100644
	 --- a/bindings/python/meson.build
	 +++ b/bindings/python/meson.build
	 @@ -1,33 +1 @@
	 -python3 = import('python3').find_python()
	 -
	 -get_overridedir = '''
	 -import os
	 -import sysconfig
	 -
	 -libdir = sysconfig.get_config_var('LIBDIR')
	 -
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
	 -
	 -if ret.returncode() != 0
	 -  error('Failed to determine pygobject overridedir')
	 -else
	 -  pygobject_override_dir = join_paths(get_option('libdir'), ret.stdout().strip())
	 -endif
	 -
	 install_data('gi/overrides/Gom.py', install_dir: pygobject_override_dir)
install :
	 ENV.refurbish_args
	 pyver = Language::Python.major_minor_version "python3"
	 inreplace "bindings/python/meson.build",
	 "install_dir: pygobject_override_dir",
	 "install_dir: '#{lib}/python#{pyver}/site-packages'"
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
