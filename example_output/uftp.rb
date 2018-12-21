name :
	 Uftp
homepage :
	 https://uftp-multicast.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/uftp-multicast/source-tar/uftp-4.9.8.tar.gz
description :
	 Secure, reliable, efficient multicast file transfer program
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "make", "OPENSSL=#{Formula["openssl"].opt_prefix}", "DESTDIR=#{prefix}", "install"
	 prefix.install Dir["#{prefix}/usr/*"]
	 (prefix/"usr").unlink
