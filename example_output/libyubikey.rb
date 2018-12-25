name :
	 Libyubikey
homepage :
	 https://yubico.github.io/yubico-c/
url :
	 https://developers.yubico.com/yubico-c/Releases/libyubikey-1.13.tar.gz
description :
	 C library for manipulating Yubico one-time passwords
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
