name :
	 Xaric
homepage :
	 https://xaric.org/
url :
	 https://xaric.org/software/xaric/releases/xaric-0.13.7.tar.gz
description :
	 IRC client
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
