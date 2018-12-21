name :
	 Rlwrap
homepage :
	 https://github.com/hanslub42/rlwrap
url :
	 https://github.com/hanslub42/rlwrap/archive/v0.43.tar.gz
description :
	 Readline wrapper: adds readline support to tools that lack it
build_deps :
	 autoconf
	 automake
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-v", "-i"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
