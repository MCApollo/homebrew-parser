name :
	 Aha
homepage :
	 https://github.com/theZiz/aha
url :
	 https://github.com/theZiz/aha/archive/0.5.tar.gz
description :
	 ANSI HTML adapter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
