name :
	 Globe
homepage :
	 https://www.acme.com/software/globe/
url :
	 https://www.acme.com/software/globe/globe_14Aug2014.tar.gz
description :
	 Prints ASCII graphic of currently-lit side of the Earth
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.mkpath
	 man1.mkpath
	 system "make", "all", "install", "BINDIR=#{bin}", "MANDIR=#{man1}"
