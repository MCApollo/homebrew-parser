name :
	 DuoUnix
homepage :
	 https://www.duosecurity.com/docs/duounix
url :
	 https://github.com/duosecurity/duo_unix/archive/duo_unix-1.11.1.tar.gz
description :
	 Two-factor authentication for SSH
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--includedir=#{include}/duo",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}",
	 "--with-pam=#{lib}/pam/"
	 system "make", "install"
