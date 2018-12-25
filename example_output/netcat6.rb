name :
	 Netcat6
homepage :
	 https://www.deepspace6.net/projects/netcat6.html
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/n/nc6/nc6_1.0.orig.tar.gz
description :
	 Rewrite of netcat that supports IPv6, plus other improvements
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
