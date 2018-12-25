name :
	 Pound
homepage :
	 http://www.apsis.ch/pound
url :
	 http://www.apsis.ch/pound/Pound-2.8.tgz
description :
	 Reverse proxy, load balancer and HTTPS front-end for web servers
build_deps :
link_deps :
	 gperftools
	 openssl
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-tcmalloc"
	 system "make"
	 sbin.install "pound", "poundctl"
	 man8.install "pound.8", "poundctl.8"
