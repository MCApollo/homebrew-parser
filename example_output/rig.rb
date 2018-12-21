name :
	 Rig
homepage :
	 https://rig.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/rig/rig/1.11/rig-1.11.tar.gz
description :
	 Provides fake name and address data
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "rig"
	 pkgshare.install Dir["data/*"]
