name :
	 Feedgnuplot
homepage :
	 https://github.com/dkogan/feedgnuplot
url :
	 https://github.com/dkogan/feedgnuplot/archive/v1.51.tar.gz
description :
	 Tool to plot realtime and stored data from the command-line
build_deps :
link_deps :
	 gnuplot
conflicts :
patches :
EOF_patch :
install :
	 system "perl", "Makefile.PL", "prefix=#{prefix}"
	 system "make"
	 system "make", "install"
