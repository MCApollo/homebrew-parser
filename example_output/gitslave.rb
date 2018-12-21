name :
	 Gitslave
homepage :
	 https://gitslave.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/gitslave/gitslave-2.0.2.tar.gz
description :
	 Create group of related repos with one as superproject
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "prefix=#{prefix}"
