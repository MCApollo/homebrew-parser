name :
	 AtSpi2Atk
homepage :
	 https://wiki.linuxfoundation.org/accessibility/
url :
	 https://download.gnome.org/sources/at-spi2-atk/2.30/at-spi2-atk-2.30.0.tar.xz
description :
	 Accessibility Toolkit GTK+ module
build_deps :
	 meson-internal
	 ninja
	 pkg-config
	 python
link_deps :
	 at-spi2-core
	 atk
conflicts :
patches :
EOF_patch :
install :
	 ENV.refurbish_args
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
