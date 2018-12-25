name :
	 JsonrpcGlib
homepage :
	 https://gitlab.gnome.org/GNOME/jsonrpc-glib
url :
	 https://download.gnome.org/sources/jsonrpc-glib/3.30/jsonrpc-glib-3.30.1.tar.xz
description :
	 GNOME library to communicate with JSON-RPC based peers
build_deps :
	 gobject-introspection
	 meson-internal
	 ninja
	 pkg-config
	 python
	 vala
link_deps :
	 glib
	 json-glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.refurbish_args
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", "-Dwith_vapi=true", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
