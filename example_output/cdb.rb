name :
	 Cdb
homepage :
	 https://cr.yp.to/cdb.html
url :
	 https://cr.yp.to/cdb/cdb-0.75.tar.gz
description :
	 Create and read constant databases
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
	 inreplace "conf-home", "/usr/local", prefix
	 system "make", "setup"
