name :
	 Libfreefare
homepage :
	 https://github.com/nfc-tools/libfreefare
url :
	 https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-0.4.0/libfreefare-0.4.0.tar.bz2
description :
	 API for MIFARE card manipulations
build_deps :
	 pkg-config
link_deps :
	 libnfc
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
