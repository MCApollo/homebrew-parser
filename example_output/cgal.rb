name :
	 Cgal
homepage :
	 https://www.cgal.org/
url :
	 https://github.com/CGAL/cgal/releases/download/releases%2FCGAL-4.13/CGAL-4.13.tar.xz
description :
	 Computational Geometry Algorithm Library
build_deps :
	 cmake
link_deps :
	 boost
	 eigen
	 gmp
	 mpfr
	 qt
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %W[
	 -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON
	 -DCMAKE_INSTALL_NAME_DIR=#{HOMEBREW_PREFIX}/lib
	 -DWITH_Eigen3=ON
	 -DWITH_LAPACK=ON
	 ]
	 if build.without? "qt"
	 args << "-DWITH_CGAL_Qt5=OFF" << "-DWITH_CGAL_ImageIO=OFF"
	 else
	 args << "-DWITH_CGAL_Qt5=ON" << "-DWITH_CGAL_ImageIO=ON"
	 end
	 system "cmake", ".", *args
	 system "make", "install"
