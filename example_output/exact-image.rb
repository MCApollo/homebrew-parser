name :
	 ExactImage
homepage :
	 https://exactcode.com/opensource/exactimage/
url :
	 https://dl.exactcode.de/oss/exact-image/exact-image-1.0.1.tar.bz2
description :
	 Image processing library
build_deps :
	 pkg-config
link_deps :
	 libagg
	 freetype
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
