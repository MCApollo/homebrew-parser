name :
	 Stunnel
homepage :
	 https://www.stunnel.org/
url :
	 https://www.stunnel.org/downloads/stunnel-5.50.tar.gz
description :
	 SSL tunneling program
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--localstatedir=#{var}",
	 "--mandir=#{man}",
	 "--disable-libwrap",
	 "--disable-systemd",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
	 cd "tools" do
	 args = %w[req -new -x509 -days 365 -rand stunnel.rnd -config
	 openssl.cnf -out stunnel.pem -keyout stunnel.pem -sha256 -subj
	 /C=PL/ST=Mazovia\ Province/L=Warsaw/O=Stunnel\ Developers/OU=Provisional\ CA/CN=localhost/]
	 system "dd", "if=/dev/urandom", "of=stunnel.rnd", "bs=256", "count=1"
	 system "#{Formula["openssl"].opt_bin}/openssl", *args
	 chmod 0600, "stunnel.pem"
	 (etc/"stunnel").install "stunnel.pem"
