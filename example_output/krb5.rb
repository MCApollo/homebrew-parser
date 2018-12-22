name :
	 Krb5
homepage :
	 https://web.mit.edu/kerberos/
url :
	 https://kerberos.org/dist/krb5/1.16/krb5-1.16.2.tar.gz
description :
	 Network authentication protocol
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 cd "src" do
	 system "./configure",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--without-system-verto"
	 system "make"
	 system "make", "install"
	 end
