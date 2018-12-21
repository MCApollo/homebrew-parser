name :
	 Mergelog
homepage :
	 https://mergelog.sourceforge.io/
url :
	 https://downloads.sourceforge.net/mergelog/mergelog-4.5.tar.gz
description :
	 Merges httpd logs from web servers behind round-robin DNS
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
