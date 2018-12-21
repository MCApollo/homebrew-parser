name :
	 Dovecot
homepage :
	 https://dovecot.org/
url :
	 https://dovecot.org/releases/2.3/dovecot-2.3.2.1.tar.gz
description :
	 IMAP/POP3 server
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --libexecdir=#{libexec}
	 --sysconfdir=#{etc}
	 --localstatedir=#{var}
	 --with-bzlib
	 --with-sqlite
	 --with-ssl=openssl
	 --with-zlib
	 ]
	 args << "--with-pam" if build.with? "pam"
	 system "./configure", *args
	 system "make", "install"
	 if build.with? "pigeonhole"
	 resource("pigeonhole").stage do
	 args = %W[
	 --disable-dependency-tracking
	 --with-dovecot=#{lib}/dovecot
	 --prefix=#{prefix}
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "install"
