name :
	 Visitors
homepage :
	 http://www.hping.org/visitors/
url :
	 http://www.hping.org/visitors/visitors-0.7.tar.gz
description :
	 Web server log analyzer
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
	 system "make"
	 bin.install "visitors"
	 man1.install "visitors.1"
