name :
	 Deark
homepage :
	 https://entropymine.com/deark/
url :
	 https://entropymine.com/deark/releases/deark-1.4.7.tar.gz
description :
	 File conversion utility for older formats
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "deark"
