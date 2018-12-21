name :
	 GnupgPkcs11Scd
homepage :
	 https://gnupg-pkcs11.sourceforge.io
url :
	 https://github.com/alonbl/gnupg-pkcs11-scd/releases/download/gnupg-pkcs11-scd-0.9.1/gnupg-pkcs11-scd-0.9.1.tar.bz2
description :
	 Enable the use of PKCS#11 tokens with GnuPG
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libassuan
	 libgcrypt
	 libgpg-error
	 pkcs11-helper
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--with-libgpg-error-prefix=#{Formula["libgpg-error"].opt_prefix}",
	 "--with-libassuan-prefix=#{Formula["libassuan"].opt_prefix}",
	 "--with-libgcrypt-prefix=#{Formula["libgcrypt"].opt_prefix}",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
