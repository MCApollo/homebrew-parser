name :
	 JsonGlib
homepage :
	 https://wiki.gnome.org/Projects/JsonGlib
url :
	 https://download.gnome.org/sources/json-glib/1.4/json-glib-1.4.4.tar.xz
description :
	 Library for JSON, based on GLib
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
link_deps :
	 glib
conflicts :
patches :
EOF_patch :
	 diff --git a/meson.build b/meson.build
	 index cee6389..50808cf 100644
	 --- a/meson.build
	 +++ b/meson.build
	 @@ -145,14 +145,6 @@ if host_system == 'linux'
	 endforeach
	 endif
	 -
	 -if host_system == 'darwin'
	 -  common_ldflags += [
	 -    '-compatibility_version 1',
	 -    '-current_version @0@.@1@'.format(json_binary_age - json_interface_age, json_interface_age),
	 -  ]
	 -endif
	 -
	 root_dir = include_directories('.')
	 gnome = import('gnome')
install :
	 ENV.refurbish_args
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
