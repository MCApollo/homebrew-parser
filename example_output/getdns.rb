name :
	 Getdns
homepage :
	 https://getdnsapi.net
url :
	 https://getdnsapi.net/releases/getdns-1-4-2/getdns-1.4.2.tar.gz
description :
	 Modern asynchronous DNS API
build_deps :
link_deps :
	 libevent
	 libidn
	 openssl
	 unbound
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "glibtoolize", "-ci"
	 system "autoreconf", "-fi"
