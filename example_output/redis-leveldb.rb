name :
	 RedisLeveldb
homepage :
	 https://github.com/KDr2/redis-leveldb
url :
	 https://github.com/KDr2/redis-leveldb/archive/v1.4.tar.gz
description :
	 Redis-protocol compatible frontend to leveldb
build_deps :
link_deps :
	 gmp
	 leveldb
	 libev
	 snappy
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/Makefile", "../vendor/libleveldb.a", Formula["leveldb"].opt_lib+"libleveldb.a"
	 ENV.prepend "LDFLAGS", "-lsnappy"
	 system "make"
	 bin.install "redis-leveldb"
