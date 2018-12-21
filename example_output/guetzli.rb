name :
	 Guetzli
homepage :
	 https://github.com/google/guetzli
url :
	 https://github.com/google/guetzli/archive/v1.0.1.tar.gz
description :
	 Perceptual JPEG encoder
build_deps :
	 pkg-config
link_deps :
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "bin/Release/guetzli"
