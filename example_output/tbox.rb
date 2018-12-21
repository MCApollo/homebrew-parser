name :
	 Tbox
homepage :
	 https://tboox.org/
url :
	 https://github.com/waruqi/tbox/archive/v1.6.3.tar.gz
description :
	 Glib-like multi-platform c library
build_deps :
	 xmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "xmake", "config", "--charset=y", "--demo=n", "--small=y", "--xml=y"
	 system "xmake", "install", "-o", prefix
