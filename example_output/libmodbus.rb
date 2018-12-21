name :
	 Libmodbus
homepage :
	 https://libmodbus.org/
url :
	 https://libmodbus.org/releases/libmodbus-3.1.4.tar.gz
description :
	 Portable modbus library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
