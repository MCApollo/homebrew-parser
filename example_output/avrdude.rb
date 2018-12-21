name :
	 Avrdude
homepage :
	 https://savannah.nongnu.org/projects/avrdude/
url :
	 https://download.savannah.gnu.org/releases/avrdude/avrdude-6.3.tar.gz
description :
	 Atmel AVR MCU programmer
build_deps :
link_deps :
	 libelf
	 libftdi0
	 libhid
	 libusb-compat
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 inreplace "bootstrap", /libtoolize/, "glibtoolize"
	 system "./bootstrap"
