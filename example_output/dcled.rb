name :
	 Dcled
homepage :
	 https://www.jeffrika.com/~malakai/dcled/index.html
url :
	 https://www.jeffrika.com/~malakai/dcled/dcled-2.2.tgz
description :
	 Linux driver for dream cheeky USB message board
build_deps :
link_deps :
	 libhid
	 libusb
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}",
	 "LIBUSB_CFLAGS=-I#{Formula["libusb"].opt_include}/libusb-1.0"
	 system "make", "install",
	 "FONTDIR=#{share}/#{name}",
	 "INSTALLDIR=#{bin}"
