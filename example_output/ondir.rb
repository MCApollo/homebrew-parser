name :
	 Ondir
homepage :
	 https://swapoff.org/ondir.html
url :
	 https://swapoff.org/files/ondir/ondir-0.2.3.tar.gz
description :
	 Automatically execute scripts as you traverse directories
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "PREFIX=#{prefix}", "install"
