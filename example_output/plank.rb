name :
	 Plank
homepage :
	 https://pinterest.github.io/plank/
url :
	 https://github.com/pinterest/plank/archive/v1.4.1.tar.gz
description :
	 Framework for generating immutable model objects
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
