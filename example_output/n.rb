name :
	 N
homepage :
	 https://github.com/tj/n
url :
	 https://github.com/tj/n/archive/v2.1.12.tar.gz
description :
	 Node version management
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.mkdir
	 system "make", "PREFIX=#{prefix}", "install"
