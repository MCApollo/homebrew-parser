name :
	 Jshon
homepage :
	 http://kmkeen.com/jshon/
url :
	 https://github.com/keenerd/jshon/archive/20131105.tar.gz
description :
	 Parse, read, and create JSON from the shell
build_deps :
link_deps :
	 jansson
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "jshon"
	 man1.install "jshon.1"
