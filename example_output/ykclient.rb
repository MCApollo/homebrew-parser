name :
	 Ykclient
homepage :
	 https://developers.yubico.com/yubico-c-client/
url :
	 https://developers.yubico.com/yubico-c-client/Releases/ykclient-2.15.tar.gz
description :
	 Library to validate YubiKey OTPs against YubiCloud
build_deps :
	 help2man
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-iv" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 system "make", "check"
