name :
	 Jsmin
homepage :
	 https://www.crockford.com/javascript/jsmin.html
url :
	 https://github.com/douglascrockford/JSMin/archive/1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b.tar.gz
description :
	 Minify JavaScript code
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system ENV.cc, "jsmin.c", "-o", "jsmin"
	 bin.install "jsmin"
