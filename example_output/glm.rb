name :
	 Glm
homepage :
	 https://glm.g-truc.net/
url :
	 https://github.com/g-truc/glm/releases/download/0.9.9.3/glm-0.9.9.3.zip
description :
	 C++ mathematics library for graphics software
build_deps :
	 cmake
	 doxygen
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
