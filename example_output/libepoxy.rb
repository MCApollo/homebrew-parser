name :
	 Libepoxy
homepage :
	 https://github.com/anholt/libepoxy
url :
	 https://download.gnome.org/sources/libepoxy/1.5/libepoxy-1.5.3.tar.xz
description :
	 Library for handling OpenGL function pointer management
build_deps :
	 meson
	 ninja
	 pkg-config
	 python
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
