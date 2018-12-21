name :
	 Libmtp
homepage :
	 https://libmtp.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/libmtp/libmtp/1.1.15/libmtp-1.1.15.tar.gz
description :
	 Implementation of Microsoft's Media Transfer Protocol (MTP)
build_deps :
	 pkg-config
link_deps :
	 libusb-compat
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-mtpz"
	 system "make", "install"
