name :
	 Flvmeta
homepage :
	 https://www.flvmeta.com/
url :
	 https://www.flvmeta.com/download.php?file=flvmeta-1.2.1.tar.gz
description :
	 Manipulate Adobe flash video files (FLV)
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
