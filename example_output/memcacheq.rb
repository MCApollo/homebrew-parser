name :
	 Memcacheq
homepage :
	 https://memcachedb.org/memcacheq/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/memcacheq/memcacheq-0.2.0.tar.gz
description :
	 Queue service for memcache
build_deps :
link_deps :
	 berkeley-db
	 libevent
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "-std=gnu89"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-threads"
	 system "make", "install"
