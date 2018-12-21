name :
	 Screenresolution
homepage :
	 https://github.com/jhford/screenresolution
url :
	 https://github.com/jhford/screenresolution/archive/v1.6.tar.gz
description :
	 Get, set, and list display resolution
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}"
	 system "make", "PREFIX=#{prefix}", "install"
