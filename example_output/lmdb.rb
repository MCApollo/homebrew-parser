name :
	 Lmdb
homepage :
	 https://symas.com/mdb-and-sqlite/
url :
	 https://github.com/LMDB/lmdb/archive/LMDB_0.9.22.tar.gz
description :
	 Lightning memory-mapped database: key-value data store
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "libraries/liblmdb" do
	 system "make", "SOEXT=.dylib"
	 system "make", "test", "SOEXT=.dylib"
	 system "make", "install", "SOEXT=.dylib", "prefix=#{prefix}"
	 end
