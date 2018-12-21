name :
	 Launchdns
homepage :
	 https://github.com/josh/launchdns
url :
	 https://github.com/josh/launchdns/archive/v1.0.3.tar.gz
description :
	 Mini DNS server designed solely to route queries to localhost
build_deps :
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV["PREFIX"] = prefix
	 system "./configure", "--with-launch-h", "--with-launch-h-activate-socket"
	 system "make", "install"
	 (prefix/"etc/resolver/localhost").write("nameserver 127.0.0.1\nport 55353\n")
