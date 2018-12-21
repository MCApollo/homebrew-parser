name :
	 Libdivecomputer
homepage :
	 https://www.libdivecomputer.org/
url :
	 https://www.libdivecomputer.org/releases/libdivecomputer-0.6.0.tar.gz
description :
	 Library for communication with various dive computers
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "--install" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
