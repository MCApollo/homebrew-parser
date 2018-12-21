name :
	 PcscLite
homepage :
	 https://pcsclite.apdu.fr/
url :
	 https://pcsclite.apdu.fr/files/pcsc-lite-1.8.23.tar.bz2
description :
	 Middleware to access a smart card using SCard API
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--disable-libsystemd"
	 system "make", "install"
