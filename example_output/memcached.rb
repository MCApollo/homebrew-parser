name :
	 Memcached
homepage :
	 https://memcached.org/
url :
	 https://www.memcached.org/files/memcached-1.5.12.tar.gz
description :
	 High performance, distributed memory object caching system
build_deps :
link_deps :
	 libevent
optional_deps :
conflicts :
	 mysql-cluster
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-coverage"
	 system "make", "install"
