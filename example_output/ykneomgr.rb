name :
	 Ykneomgr
homepage :
	 https://developers.yubico.com/libykneomgr/
url :
	 https://developers.yubico.com/libykneomgr/Releases/libykneomgr-0.1.8.tar.gz
description :
	 CLI and C library to interact with the CCID-part of the YubiKey NEO
build_deps :
	 help2man
	 pkg-config
link_deps :
	 libzip
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "autoreconf" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "check"
	 system "make", "install"
