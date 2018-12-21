name :
	 Phoon
homepage :
	 https://www.acme.com/software/phoon/
url :
	 https://www.acme.com/software/phoon/phoon_14Aug2014.tar.gz
description :
	 Displays current or specified phase of the moon via ASCII art
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "phoon"
	 man1.install "phoon.1"
