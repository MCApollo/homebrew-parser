name :
	 Peg
homepage :
	 http://piumarta.com/software/peg/
url :
	 http://piumarta.com/software/peg/peg-0.1.18.tar.gz
description :
	 Program to perform pattern matching on text
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "all"
	 bin.install %w[peg leg]
	 man1.install gzip("src/peg.1")
