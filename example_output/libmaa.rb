name :
	 Libmaa
homepage :
	 http://www.dict.org/
url :
	 https://downloads.sourceforge.net/project/dict/libmaa/libmaa-1.4.2/libmaa-1.4.2.tar.gz
description :
	 Low-level data structures including hash tables, sets, lists
build_deps :
	 bmake
	 mk-configure
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "mkcmake", "install", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
