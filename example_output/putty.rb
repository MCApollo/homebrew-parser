name :
	 Putty
homepage :
	 https://www.chiark.greenend.org.uk/~sgtatham/putty/
url :
	 https://the.earth.li/~sgtatham/putty/0.70/putty-0.70.tar.gz
description :
	 Implementation of Telnet and SSH
build_deps :
	 pkg-config
link_deps :
conflicts :
	 pssh
patches :
EOF_patch :
install :
	 if build.head?
	 system "./mkfiles.pl"
	 system "./mkauto.sh"
	 system "make", "-C", "doc"
