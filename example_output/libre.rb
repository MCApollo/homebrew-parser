name :
	 Libre
homepage :
	 http://www.creytiv.com
url :
	 http://www.creytiv.com/pub/re-0.5.9.tar.gz
description :
	 Toolkit library for asynchronous network I/O with protocol stacks
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "make", "SYSROOT=#{MacOS.sdk_path}/usr", "install", "PREFIX=#{prefix}"
