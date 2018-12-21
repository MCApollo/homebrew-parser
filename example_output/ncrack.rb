name :
	 Ncrack
homepage :
	 https://nmap.org/ncrack/
url :
	 https://github.com/nmap/ncrack/archive/v0.6.0.tar.gz
description :
	 Network authentication cracking tool
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
