name :
	 Pipemeter
homepage :
	 https://launchpad.net/pipemeter
url :
	 https://launchpad.net/pipemeter/trunk/1.1.3/+download/pipemeter-1.1.3.tar.gz
description :
	 Shows speed of data moving from input to output
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 inreplace "Makefile", "$(PREFIX)/man/man1", man1
	 bin.mkpath
	 man1.mkpath
	 system "make", "install"
