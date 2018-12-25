name :
	 Lepton
homepage :
	 https://github.com/dropbox/lepton
url :
	 https://github.com/dropbox/lepton/archive/1.2.1.tar.gz
description :
	 Tool and file format for losslessly compressing JPEGs
build_deps :
	 cmake
link_deps :
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
