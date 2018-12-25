name :
	 Wiredtiger
homepage :
	 http://www.wiredtiger.com
url :
	 https://github.com/wiredtiger/wiredtiger/releases/download/3.1.0/wiredtiger-3.1.0.tar.bz2
description :
	 High performance NoSQL extensible platform for data management
build_deps :
link_deps :
	 snappy
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--with-builtins=snappy,zlib",
	 "--with-python",
	 "--prefix=#{prefix}"
	 system "make", "install"
