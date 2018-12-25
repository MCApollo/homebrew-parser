name :
	 Bwctl
homepage :
	 https://software.internet2.edu/bwctl/
url :
	 https://software.internet2.edu/sources/bwctl/bwctl-1.5.4.tar.gz
description :
	 Command-line tool and daemon for network measuring tools
build_deps :
	 i2util
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "configure", 'CFLAGS="-I$I2util_dir/include $CFLAGS"', 'CFLAGS="-I$with_I2util/include $CFLAGS"'
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-I2util=#{Formula["i2util"].opt_prefix}"
	 system "make", "install"
