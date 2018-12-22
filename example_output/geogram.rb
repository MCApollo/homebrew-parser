name :
	 Geogram
homepage :
	 http://alice.loria.fr/software/geogram/doc/html/index.html
url :
	 https://gforge.inria.fr/frs/download.php/file/37675/geogram_1.6.7.tar.gz
description :
	 Programming library of geometric algorithms
build_deps :
	 cmake
link_deps :
	 glfw
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"CMakeOptions.txt").append_lines <<~EOS
	 set(CMAKE_INSTALL_PREFIX #{prefix})
	 set(GEOGRAM_USE_SYSTEM_GLFW3 ON)
	 EOS
	 system "./configure.sh"
	 cd "build/Darwin-clang-dynamic-Release" do
	 system "make", "install"
	 end
	 (share/"cmake/Modules").install Dir[lib/"cmake/modules/*"]
