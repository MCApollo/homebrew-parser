name :
	 Dvorak7min
homepage :
	 https://web.archive.org/web/dvorak7min.sourcearchive.com/
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/d/dvorak7min/dvorak7min_1.6.1+repack.orig.tar.gz
description :
	 Dvorak (simplified keyboard layout) typing tutor
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
	 system "make", "clean"
	 system "make"
	 system "make", "INSTALL=#{bin}", "install"
