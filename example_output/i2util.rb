name :
	 I2util
homepage :
	 https://software.internet2.edu/
url :
	 https://software.internet2.edu/sources/I2util/I2util-1.2.tar.gz
description :
	 Internet2 utility tools
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
