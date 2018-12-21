name :
	 Msmtp
homepage :
	 https://marlam.de/msmtp/
url :
	 https://marlam.de/msmtp/releases/msmtp-1.6.6.tar.xz
description :
	 SMTP client that can be used as an SMTP plugin for Mutt
build_deps :
	 pkg-config
link_deps :
	 openssl
	 gsasl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --with-macosx-keyring
	 --prefix=#{prefix}
	 --with-tls=openssl
	 ]
	 args << "--with-libsasl" if build.with? "gsasl"
	 system "./configure", *args
	 system "make", "install"
	 (pkgshare/"scripts").install "scripts/msmtpq"
