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
optional_deps :
conflicts :
resource :
	 ['test_image']
	 ['https://github.com/google/guetzli/releases/download/v1.0/bees.png']
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "bin/Release/guetzli"
