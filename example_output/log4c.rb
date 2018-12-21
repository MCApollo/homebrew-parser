name :
	 Log4c
homepage :
	 https://log4c.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/log4c/log4c/1.2.4/log4c-1.2.4.tar.gz
description :
	 Logging Framework for C
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
