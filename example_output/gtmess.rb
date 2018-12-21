name :
	 Gtmess
homepage :
	 https://gtmess.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gtmess/gtmess/0.97/gtmess-0.97.tar.gz
description :
	 Console MSN messenger client
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
