name :
	 Gcab
homepage :
	 https://wiki.gnome.org/msitools
url :
	 https://download.gnome.org/sources/gcab/1.2/gcab-1.2.tar.xz
description :
	 Windows installer (.MSI) tool
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
	 python
	 vala
link_deps :
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/libgcab/meson.build b/libgcab/meson.build
	 index 6ff8801..3d1a350 100644
	 --- a/libgcab/meson.build
	 +++ b/libgcab/meson.build
	 @@ -27,8 +27,6 @@ install_headers([
	 subdir : 'libgcab-1.0/libgcab',
	 )
	 -mapfile = 'libgcab.syms'
	 -vflag = '-Wl,--version-script,@0@/@1@'.format(meson.current_source_dir(), mapfile)
	 libgcab = shared_library(
	 'gcab-1.0',
	 enums,
	 @@ -50,8 +48,6 @@ libgcab = shared_library(
	 include_directories('.'),
	 include_directories('..'),
	 ],
	 -  link_args : vflag,
	 -  link_depends : mapfile,
	 install : true
	 )
	 diff --git a/meson.build b/meson.build
	 index 1a29b5a..ff45829 100644
	 --- a/meson.build
	 +++ b/meson.build
	 @@ -72,10 +72,7 @@ endforeach
	 global_link_args = []
	 -test_link_args = [
	 -  '-Wl,-z,relro',
	 -  '-Wl,-z,now',
	 -]
	 +test_link_args = []
	 foreach arg: test_link_args
	 if cc.has_argument(arg)
	 global_link_args += arg
install :
	 ENV.refurbish_args
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", "-Ddocs=false", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
