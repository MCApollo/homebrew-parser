name :
	 Libchaos
homepage :
	 https://github.com/maciejczyzewski/libchaos
url :
	 https://github.com/maciejczyzewski/libchaos/releases/download/v1.0/libchaos-1.0.tar.gz
description :
	 Advanced library for randomization, hashing and statistical analysis
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DLIBCHAOS_ENABLE_TESTING=OFF", *std_cmake_args
	 system "make", "install"
