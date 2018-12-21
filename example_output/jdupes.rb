name :
	 Jdupes
homepage :
	 https://github.com/jbruchon/jdupes
url :
	 https://github.com/jbruchon/jdupes/archive/v1.11.1.tar.gz
description :
	 Duplicate file finder and an enhanced fork of 'fdupes'
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
