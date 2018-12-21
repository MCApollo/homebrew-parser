name :
	 Wbox
homepage :
	 http://hping.org/wbox/
url :
	 http://www.hping.org/wbox/wbox-5.tar.gz
description :
	 HTTP testing tool and configuration-less HTTP server
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "wbox"
