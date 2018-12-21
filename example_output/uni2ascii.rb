name :
	 Uni2ascii
homepage :
	 https://billposer.org/Software/uni2ascii.html
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/u/uni2ascii/uni2ascii_4.18.orig.tar.gz
description :
	 Bi-directional conversion between UTF-8 and various ASCII flavors
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 ENV["MKDIRPROG"]="mkdir -p"
	 system "make", "install"
