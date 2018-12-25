name :
	 YubicoPivTool
homepage :
	 https://developers.yubico.com/yubico-piv-tool/
url :
	 https://developers.yubico.com/yubico-piv-tool/Releases/yubico-piv-tool-1.6.2.tar.gz
description :
	 Command-line tool for the YubiKey PIV application
build_deps :
	 check
	 pkg-config
link_deps :
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
