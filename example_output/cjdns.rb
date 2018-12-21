name :
	 Cjdns
homepage :
	 https://github.com/cjdelisle/cjdns/
url :
	 https://github.com/cjdelisle/cjdns/archive/cjdns-v20.2.tar.gz
description :
	 Advanced mesh routing system with cryptographic addressing
build_deps :
	 node
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./do"
	 bin.install "cjdroute"
	 (pkgshare/"test").install "build_darwin/test_testcjdroute_c" => "cjdroute_test"
