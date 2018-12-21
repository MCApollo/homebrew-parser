name :
	 Nq
homepage :
	 https://github.com/chneukirchen/nq
url :
	 https://github.com/chneukirchen/nq/archive/v0.3.1.tar.gz
description :
	 Unix command-line queue utility
build_deps :
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "make", "all", "PREFIX=#{prefix}"
	 system "make", "install", "PREFIX=#{prefix}"
