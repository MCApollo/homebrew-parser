name :
	 Vfuse
homepage :
	 https://github.com/chilcote/vfuse
url :
	 https://github.com/chilcote/vfuse/archive/2.0.9.tar.gz
description :
	 Convert bootable DMG images for use in VMware Fusion
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install Dir["pkgroot/usr/local/vfuse/bin/*"]
