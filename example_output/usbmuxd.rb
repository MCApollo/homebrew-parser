name :
	 Usbmuxd
homepage :
	 https://www.libimobiledevice.org/
url :
	 https://www.libimobiledevice.org/downloads/libusbmuxd-1.0.10.tar.bz2
description :
	 USB multiplexor daemon for iPhone and iPod Touch devices
build_deps :
	 pkg-config
link_deps :
	 libplist
	 libusb
conflicts :
patches :
	 https://github.com/libimobiledevice/libusbmuxd/commit/4397b3376dc4.patch?full_index=1
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
