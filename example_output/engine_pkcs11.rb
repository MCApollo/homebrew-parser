name :
	 EnginePkcs11
homepage :
	 https://github.com/OpenSC/OpenSC/wiki/OpenSSL-engine-for-PKCS%2311-modules
url :
	 https://downloads.sourceforge.net/project/opensc/engine_pkcs11/engine_pkcs11-0.1.8.tar.gz
description :
	 Implementation of OpenSSL engine interface
build_deps :
	 pkg-config
link_deps :
	 libp11
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
