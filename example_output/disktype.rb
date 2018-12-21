name :
	 Disktype
homepage :
	 https://disktype.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/disktype/disktype/9/disktype-9.tar.gz
description :
	 Detect content format of a disk or disk image
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "disktype"
	 man1.install "disktype.1"
