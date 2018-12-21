name :
	 Lcdproc
homepage :
	 http://www.lcdproc.org/
url :
	 https://github.com/lcdproc/lcdproc/releases/download/v0.5.9/lcdproc-0.5.9.tar.gz
description :
	 Display real-time system information on a LCD
build_deps :
	 pkg-config
link_deps :
	 libftdi0
	 libhid
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--enable-drivers=all",
	 "--enable-libftdi=yes"
	 system "make", "install"
