name :
	 Ykpers
homepage :
	 https://developers.yubico.com/yubikey-personalization/
url :
	 https://developers.yubico.com/yubikey-personalization/Releases/ykpers-1.19.0.tar.gz
description :
	 YubiKey personalization library and tool
build_deps :
	 pkg-config
link_deps :
	 json-c
	 libyubikey
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libyubikey_prefix = Formula["libyubikey"].opt_prefix
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-libyubikey-prefix=#{libyubikey_prefix}",
	 "--with-backend=osx"
	 system "make", "check"
	 system "make", "install"
