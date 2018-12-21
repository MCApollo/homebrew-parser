name :
	 Openvpn
homepage :
	 https://openvpn.net/index.php/download/community-downloads.html
url :
	 https://swupdate.openvpn.org/community/releases/openvpn-2.4.6.tar.xz
description :
	 SSL/TLS VPN implementing OSI layer 2 or 3 secure network extension
build_deps :
	 pkg-config
link_deps :
	 lz4
	 lzo
	 :macos
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 vendor = buildpath/"brew_vendor"
	 resource("pkcs11-helper").stage do
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{vendor}/pkcs11-helper",
	 "--disable-threading",
	 "--disable-slotevent",
	 "--disable-shared"
	 system "make", "install"
	 (var/"run/openvpn").mkpath
