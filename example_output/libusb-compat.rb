name :
	 LibusbCompat
homepage :
	 https://libusb.info/
url :
	 https://downloads.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-0.1.5/libusb-compat-0.1.5.tar.bz2
description :
	 Library for USB device access
build_deps :
	 pkg-config
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
