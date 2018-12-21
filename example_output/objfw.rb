name :
	 Objfw
homepage :
	 https://heap.zone/objfw/
url :
	 https://heap.zone/objfw/downloads/objfw-0.90.2.tar.gz
description :
	 Portable, lightweight framework for the Objective-C language
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
