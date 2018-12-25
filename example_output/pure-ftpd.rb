name :
	 PureFtpd
homepage :
	 https://www.pureftpd.org/
url :
	 https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-1.0.47.tar.gz
description :
	 Secure and efficient FTP server
build_deps :
link_deps :
	 libsodium
	 openssl
optional_deps :
	 mysql
	 postgresql
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --sysconfdir=#{etc}
	 --with-everything
	 --with-pam
	 --with-tls
	 --with-bonjour
	 ]
	 args << "--with-pgsql" if build.with? "postgresql"
	 args << "--with-mysql" if build.with? "mysql"
	 args << "--with-virtualchroot" if build.with? "virtualchroot"
	 system "./configure", *args
	 system "make", "install"
