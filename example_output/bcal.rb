name :
	 Bcal
homepage :
	 https://github.com/jarun/bcal
url :
	 https://github.com/jarun/bcal/archive/v2.1.tar.gz
description :
	 Storage conversion and expression calculator
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
