name :
	 Gwenhywfar
homepage :
	 https://www.aquamaniac.de/
url :
	 https://www.aquamaniac.de/sites/download/download.php?package=01&release=208&file=02&dummy=gwenhywfar-4.20.0.tar.gz
description :
	 Utility library required by aqbanking and related software
build_deps :
	 pkg-config
link_deps :
	 gettext
	 gnutls
	 libgcrypt
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-guis=cocoa"
	 system "make", "install"
