name :
	 Awk
homepage :
	 https://www.cs.princeton.edu/~bwk/btl.mirror/
url :
	 https://github.com/onetrueawk/awk/archive/20180827.tar.gz
description :
	 Text processing scripting language
build_deps :
link_deps :
optional_deps :
conflicts :
	 gawk
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.O3
	 ENV.deparallelize
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}", "YACC=yacc -d"
	 bin.install "a.out" => "awk"
	 man1.install "awk.1"
