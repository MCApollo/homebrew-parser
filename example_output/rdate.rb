name :
	 Rdate
homepage :
	 https://www.aelius.com/njh/rdate/
url :
	 https://www.aelius.com/njh/rdate/rdate-1.5.tar.gz
description :
	 Set the system's date from a remote host
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
