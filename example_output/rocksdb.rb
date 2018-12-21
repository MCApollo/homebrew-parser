name :
	 Rocksdb
homepage :
	 https://rocksdb.org/
url :
	 https://github.com/facebook/rocksdb/archive/rocksdb-5.14.3.tar.gz
description :
	 Embeddable, persistent key-value store for fast storage
build_deps :
link_deps :
	 gflags
	 lz4
	 snappy
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV["PORTABLE"] = "1" if build.bottle?
	 ENV["DEBUG_LEVEL"] = "0"
	 ENV["USE_RTTI"] = "1"
	 ENV["DISABLE_JEMALLOC"] = "1"
	 system "make", "clean"
	 system "make", "static_lib"
	 system "make", "shared_lib"
	 system "make", "tools"
	 system "make", "install", "INSTALL_PATH=#{prefix}"
	 bin.install "sst_dump" => "rocksdb_sst_dump"
	 bin.install "db_sanity_test" => "rocksdb_sanity_test"
	 bin.install "db_stress" => "rocksdb_stress"
	 bin.install "write_stress" => "rocksdb_write_stress"
	 bin.install "ldb" => "rocksdb_ldb"
	 bin.install "db_repl_stress" => "rocksdb_repl_stress"
	 bin.install "rocksdb_dump"
	 bin.install "rocksdb_undump"
	 ENV.append_to_cflags "-DROCKSDB_LITE=1"
	 ENV["LIBNAME"] = "librocksdb_lite"
	 system "make", "clean"
	 system "make", "static_lib"
	 system "make", "shared_lib"
	 system "make", "install", "INSTALL_PATH=#{prefix}"
