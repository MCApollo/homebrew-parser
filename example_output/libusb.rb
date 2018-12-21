name :
	 Libusb
homepage :
	 https://libusb.info/
url :
	 https://github.com/libusb/libusb/releases/download/v1.0.22/libusb-1.0.22.tar.bz2
description :
	 Library for USB device access
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[--disable-dependency-tracking --prefix=#{prefix}]
	 args << "--disable-log" if build.without? "runtime-logging"
	 args << "--enable-debug-log" if build.with? "default-log-level-debug"
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make", "install"
	 pkgshare.install "examples"
