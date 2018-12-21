name :
	 Redsocks
homepage :
	 https://darkk.net.ru/redsocks/
url :
	 https://github.com/darkk/redsocks/archive/release-0.4.tar.gz
description :
	 Transparent socks redirector
build_deps :
link_deps :
	 libevent
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "redsocks"
