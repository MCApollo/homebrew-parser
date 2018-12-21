name :
	 Lft
homepage :
	 https://pwhois.org/lft/
url :
	 https://pwhois.org/dl/index.who?file=lft-3.79.tar.gz
description :
	 Layer Four Traceroute (LFT), an advanced traceroute tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
