name :
	 Zlog
homepage :
	 https://github.com/HardySimpson/zlog
url :
	 https://github.com/HardySimpson/zlog/archive/1.2.12.tar.gz
description :
	 High-performance C logging library
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
	 system "make", "PREFIX=#{prefix}", "install"
