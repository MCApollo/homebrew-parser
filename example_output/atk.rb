name :
	 Atk
homepage :
	 https://library.gnome.org/devel/atk/
url :
	 https://download.gnome.org/sources/atk/2.30/atk-2.30.0.tar.xz
description :
	 GNOME accessibility toolkit
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
	 index 59abf5e..7af4f12 100644
	 --- a/meson.build
	 +++ b/meson.build
	 @@ -73,11 +73,6 @@ if host_machine.system() == 'linux'
	 common_ldflags += cc.get_supported_link_arguments(test_ldflags)
	 -
	 -if host_machine.system() == 'darwin'
	 -  common_ldflags += [ '-compatibility_version 1', '-current_version 1.0', ]
	 -endif
	 -
	 checked_funcs = [
	 'bind_textdomain_codeset',
install :
	 ENV.refurbish_args
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
