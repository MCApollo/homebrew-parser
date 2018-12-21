name :
	 Pkcs11Helper
homepage :
	 https://github.com/OpenSC/OpenSC/wiki/pkcs11-helper
url :
	 https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-1.25.1/pkcs11-helper-1.25.1.tar.bz2
description :
	 Library to simplify the interaction with PKCS#11
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 system "autoreconf", "--verbose", "--install", "--force"
	 system "./configure", *args
	 system "make", "install"
