name :
	 Ipv6toolkit
homepage :
	 https://www.si6networks.com/tools/ipv6toolkit/
url :
	 https://www.si6networks.com/tools/ipv6toolkit/ipv6toolkit-v2.0.tar.gz
description :
	 Security assessment and troubleshooting tool for IPv6
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "DESTDIR=#{prefix}", "PREFIX=", "MANPREFIX=/share"
