name :
	 Libmpdclient
homepage :
	 https://www.musicpd.org/libs/libmpdclient/
url :
	 https://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.14.tar.xz
description :
	 Library for MPD in the C, C++, and Objective-C languages
build_deps :
	 doxygen
	 meson-internal
	 ninja
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "meson", "--prefix=#{prefix}", ".", "output"
	 system "ninja", "-C", "output"
	 system "ninja", "-C", "output", "install"
