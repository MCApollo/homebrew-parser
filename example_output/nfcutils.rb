name :
	 Nfcutils
homepage :
	 https://github.com/nfc-tools/nfcutils
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/nfc-tools/nfcutils-0.3.2.tar.gz
description :
	 Near Field Communication (NFC) tools under POSIX systems
build_deps :
	 pkg-config
link_deps :
	 libnfc
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
