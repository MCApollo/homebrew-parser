name :
	 Ext4fuse
homepage :
	 https://github.com/gerard/ext4fuse
url :
	 https://github.com/gerard/ext4fuse/archive/v0.1.3.tar.gz
description :
	 Read-only implementation of ext4 for FUSE
build_deps :
	 pkg-config
link_deps :
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "ext4fuse"
