name :
	 Tinc
homepage :
	 https://www.tinc-vpn.org/
url :
	 https://tinc-vpn.org/packages/tinc-1.0.35.tar.gz
description :
	 Virtual Private Network (VPN) tool
build_deps :
link_deps :
	 lzo
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
