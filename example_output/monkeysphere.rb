name :
	 Monkeysphere
homepage :
	 https://web.monkeysphere.info/
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/m/monkeysphere/monkeysphere_0.41.orig.tar.gz
description :
	 Use the OpenPGP web of trust to verify ssh connections
build_deps :
	 gnu-sed
link_deps :
	 libassuan
	 libgcrypt
	 libgpg-error
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", Formula["gnu-sed"].libexec/"gnubin"
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resource("Crypt::OpenSSL::Bignum").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
