name :
	 Leveldb
homepage :
	 https://github.com/google/leveldb/
url :
	 https://github.com/google/leveldb/archive/v1.20.tar.gz
description :
	 Key-value storage library with ordered mapping
build_deps :
link_deps :
	 gperftools
	 snappy
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "check" if build.bottle?
	 include.install "include/leveldb"
	 bin.install "out-static/leveldbutil"
	 lib.install "out-static/libleveldb.a"
	 lib.install "out-shared/libleveldb.dylib.1.20" => "libleveldb.1.20.dylib"
	 lib.install_symlink lib/"libleveldb.1.20.dylib" => "libleveldb.dylib"
	 lib.install_symlink lib/"libleveldb.1.20.dylib" => "libleveldb.1.dylib"
	 MachO::Tools.change_dylib_id("#{lib}/libleveldb.1.dylib", "#{lib}/libleveldb.1.20.dylib")
