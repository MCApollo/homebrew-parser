name :
	 Libftdi0
homepage :
	 https://www.intra2net.com/en/developer/libftdi
url :
	 https://www.intra2net.com/en/developer/libftdi/download/libftdi-0.20.tar.gz
description :
	 Library to talk to FTDI chips
build_deps :
link_deps :
	 libusb-compat
conflicts :
	 cspice
	 openhmd
patches :
EOF_patch :
install :
	 mkdir "libftdi-build" do
	 system "../configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 end
