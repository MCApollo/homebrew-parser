name :
	 Mfoc
homepage :
	 https://github.com/nfc-tools/mfoc
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mfoc/mfoc-0.10.7.tar.bz2
description :
	 Implementation of 'offline nested' attack by Nethemba
build_deps :
	 pkg-config
link_deps :
	 libnfc
	 libusb
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
