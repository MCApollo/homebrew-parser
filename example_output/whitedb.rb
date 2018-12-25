name :
	 Whitedb
homepage :
	 http://whitedb.org/
url :
	 http://whitedb.org/whitedb-0.7.3.tar.gz
description :
	 Lightweight in-memory NoSQL database library
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
	 ENV.append "CFLAGS", "-std=gnu89"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
