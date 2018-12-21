name :
	 Chgems
homepage :
	 https://github.com/postmodern/chgems#readme
url :
	 https://github.com/postmodern/chgems/archive/v0.3.2.tar.gz
description :
	 Chroot for Ruby gems
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
