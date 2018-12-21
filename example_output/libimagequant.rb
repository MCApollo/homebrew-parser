name :
	 Libimagequant
homepage :
	 https://pngquant.org/lib/
url :
	 https://github.com/ImageOptim/libimagequant/archive/2.12.2.tar.gz
description :
	 Palette quantization library extracted from pnquant2
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
