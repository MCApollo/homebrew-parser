name :
	 Jose
homepage :
	 https://github.com/latchset/jose
url :
	 https://github.com/latchset/jose/releases/download/v10/jose-10.tar.bz2
description :
	 C-language implementation of Javascript Object Signing and Encryption
build_deps :
	 pkg-config
link_deps :
	 jansson
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
