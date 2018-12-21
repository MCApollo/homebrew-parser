name :
	 Libpsl
homepage :
	 https://rockdaboot.github.io/libpsl
url :
	 https://github.com/rockdaboot/libpsl/releases/download/libpsl-0.20.2/libpsl-0.20.2.tar.gz
description :
	 C library for the Public Suffix List
build_deps :
	 pkg-config
link_deps :
	 libidn2
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
