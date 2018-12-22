name :
	 Graphene
homepage :
	 https://ebassi.github.io/graphene/
url :
	 https://download.gnome.org/sources/graphene/1.8/graphene-1.8.2.tar.xz
description :
	 Thin layer of graphic data types
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
	 python
link_deps :
	 glib
conflicts :
patches :
EOF_patch :
	 diff --git a/meson.build b/meson.build
	 index 0736994..5932028 100644
	 --- a/meson.build
	 +++ b/meson.build
	 @@ -112,11 +112,6 @@ if host_system == 'linux' and cc.get_id() == 'gcc'
	 common_ldflags = [ '-Wl,-Bsymbolic-functions', '-Wl,-z,relro', '-Wl,-z,now', ]
	 -
	 -if host_system == 'darwin'
	 -  common_ldflags += [ '-compatibility_version 1', '-current_version 1.0', ]
	 -endif
	 -
	 mathlib = cc.find_library('m', required: false)
	 threadlib = dependency('threads')
install :
	 ENV.refurbish_args
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
