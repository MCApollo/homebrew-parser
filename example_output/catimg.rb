name :
	 Catimg
homepage :
	 https://github.com/posva/catimg
url :
	 https://github.com/posva/catimg/archive/2.5.0.tar.gz
description :
	 Insanely fast image printing in your terminal
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
	 system "cmake", "-DMAN_OUTPUT_PATH=#{man1}", ".", *std_cmake_args
	 system "make", "install"
