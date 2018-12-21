name :
	 Gifski
homepage :
	 https://gif.ski/
url :
	 https://github.com/ImageOptim/gifski/archive/0.8.5.tar.gz
description :
	 Highest-quality GIF encoder based on pngquant
build_deps :
	 pkg-config
	 rust
link_deps :
	 gcc
conflicts :
patches :
EOF_patch :
install :
	 args = []
	 args << "--features=openmp" if build.with? "openmp"
	 system "cargo", "install", "--root", prefix, "--path", ".", *args
