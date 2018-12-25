name :
	 Sdb
homepage :
	 https://github.com/radare/sdb
url :
	 https://github.com/radare/sdb/archive/1.3.0.tar.gz
description :
	 Ondisk/memory hashtable based on CDB
build_deps :
	 pkg-config
	 vala
link_deps :
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"
