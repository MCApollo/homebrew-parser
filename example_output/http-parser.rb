name :
	 HttpParser
homepage :
	 https://github.com/nodejs/http-parser
url :
	 https://github.com/nodejs/http-parser/archive/v2.8.1.tar.gz
description :
	 HTTP request/response parser for c
build_deps :
	 coreutils
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}", "INSTALL=ginstall"
	 pkgshare.install "test.c"
