name :
	 Hidapi
homepage :
	 https://github.com/signal11/hidapi
url :
	 https://github.com/signal11/hidapi/archive/hidapi-0.8.0-rc1.tar.gz
description :
	 Library for communicating with USB and Bluetooth HID devices
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
conflicts :
patches :
	 https://github.com/signal11/hidapi/pull/219.patch?full_index=1
EOF_patch :
install :
	 system "./bootstrap"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 bin.install "hidtest/.libs/hidtest"
