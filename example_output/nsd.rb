name :
	 Nsd
homepage :
	 https://www.nlnetlabs.nl/projects/nsd/
url :
	 https://www.nlnetlabs.nl/downloads/nsd/nsd-4.1.25.tar.gz
description :
	 Name server daemon
build_deps :
link_deps :
	 libevent
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--localstatedir=#{var}",
	 "--with-libevent=#{Formula["libevent"].opt_prefix}",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
