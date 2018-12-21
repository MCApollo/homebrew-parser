name :
	 Nnn
homepage :
	 https://github.com/jarun/nnn
url :
	 https://github.com/jarun/nnn/archive/v2.1.tar.gz
description :
	 Free, fast, friendly file browser
build_deps :
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
