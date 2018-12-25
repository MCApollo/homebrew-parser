name :
	 Perceptualdiff
homepage :
	 https://pdiff.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/pdiff/pdiff/perceptualdiff-1.1.1/perceptualdiff-1.1.1-src.tar.gz
description :
	 Perceptual image comparison tool
build_deps :
	 cmake
link_deps :
	 freeimage
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
