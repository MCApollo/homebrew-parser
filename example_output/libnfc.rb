name :
	 Libnfc
homepage :
	 http://nfc-tools.org
url :
	 https://bintray.com/artifact/download/nfc-tools/sources/libnfc-1.7.1.tar.bz2
description :
	 Low level NFC SDK and Programmers API
build_deps :
	 pkg-config
link_deps :
	 libusb-compat
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--enable-serial-autoprobe",
	 "--with-drivers=all"
	 system "make", "install"
	 (prefix/"etc/nfc/libnfc.conf").write "allow_intrusive_scan=yes"
