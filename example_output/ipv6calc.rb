name :
	 Ipv6calc
homepage :
	 https://www.deepspace6.net/projects/ipv6calc.html
url :
	 https://github.com/pbiering/ipv6calc/archive/1.1.0.tar.gz
description :
	 Small utility for manipulating IPv6 addresses
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
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make"
	 system "make", "install"
