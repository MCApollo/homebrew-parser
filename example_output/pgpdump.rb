name :
	 Pgpdump
homepage :
	 https://www.mew.org/~kazu/proj/pgpdump/en/
url :
	 https://github.com/kazu-yamamoto/pgpdump/archive/v0.33.tar.gz
description :
	 PGP packet visualizer
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
