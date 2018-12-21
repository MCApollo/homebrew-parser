name :
	 DfuProgrammer
homepage :
	 https://dfu-programmer.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/dfu-programmer/dfu-programmer/0.7.2/dfu-programmer-0.7.2.tar.gz
description :
	 Device firmware update based USB programmer for Atmel chips
build_deps :
link_deps :
	 libusb-compat
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-libusb_1_0"
	 system "make", "install"
