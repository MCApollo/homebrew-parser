name :
	 Mfcuk
homepage :
	 https://github.com/nfc-tools/mfcuk
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mfcuk/mfcuk-0.3.8.tar.gz
description :
	 MiFare Classic Universal toolKit
build_deps :
	 pkg-config
link_deps :
	 libnfc
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
