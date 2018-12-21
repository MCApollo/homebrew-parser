name :
	 Wimlib
homepage :
	 https://wimlib.net/
url :
	 https://wimlib.net/downloads/wimlib-1.12.0.tar.gz
description :
	 Library to create, extract, and modify Windows Imaging files
build_deps :
	 pkg-config
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --without-fuse
	 --without-ntfs-3g
	 ]
	 system "./configure", *args
	 system "make", "install"
