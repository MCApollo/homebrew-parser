name :
	 Unyaffs
homepage :
	 https://github.com/ehlers/unyaffs
url :
	 https://github.com/ehlers/unyaffs/archive/0.9.7.tar.gz
description :
	 Extract files from a YAFFS2 filesystem image
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "unyaffs"
