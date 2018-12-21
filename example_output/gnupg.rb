name :
	 Gnupg
homepage :
	 https://gnupg.org/
url :
	 https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.12.tar.bz2
description :
	 GNU Pretty Good Privacy (PGP) package
build_deps :
	 pkg-config
link_deps :
	 sqlite
	 adns
	 gettext
	 gnutls
	 libassuan
	 libgcrypt
	 libgpg-error
	 libksba
	 libusb
	 npth
	 pinentry
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--sbindir=#{bin}",
	 "--sysconfdir=#{etc}",
	 "--enable-all-tests",
	 "--enable-symcryptrun",
	 "--with-pinentry-pgm=#{Formula["pinentry"].opt_bin}/pinentry"
	 system "make"
	 system "make", "check"
	 system "make", "install"
	 (var/"run").mkpath
	 quiet_system "killall", "gpg-agent"
