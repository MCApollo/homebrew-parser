name :
	 Visp
homepage :
	 https://visp.inria.fr/
url :
	 https://gforge.inria.fr/frs/download.php/latestfile/475/visp-3.1.0.tar.gz
description :
	 Visual Servoing Platform library
build_deps :
	 cmake
link_deps :
	 eigen
	 gsl
	 jpeg
	 libdc1394
	 libpng
	 opencv
	 zbar
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 sdk = MacOS::CLT.installed? ? "" : MacOS.sdk_path
	 system "cmake", ".", "-DBUILD_DEMOS=OFF",
	 "-DBUILD_EXAMPLES=OFF",
	 "-DBUILD_TESTS=OFF",
	 "-DBUILD_TUTORIALS=OFF",
	 "-DUSE_DC1394=ON",
	 "-DDC1394_INCLUDE_DIR=#{Formula["libdc1394"].opt_include}",
	 "-DDC1394_LIBRARY=#{Formula["libdc1394"].opt_lib}/libdc1394.dylib",
	 "-DUSE_EIGEN3=ON",
	 "-DEigen3_DIR=#{Formula["eigen"].opt_share}/eigen3/cmake",
	 "-DUSE_GSL=ON",
	 "-DGSL_INCLUDE_DIR=#{Formula["gsl"].opt_include}",
	 "-DGSL_cblas_LIBRARY=#{Formula["gsl"].opt_lib}/libgslcblas.dylib",
	 "-DGSL_gsl_LIBRARY=#{Formula["gsl"].opt_lib}/libgsl.dylib",
	 "-DUSE_JPEG=ON",
	 "-DJPEG_INCLUDE_DIR=#{Formula["jpeg"].opt_include}",
	 "-DJPEG_LIBRARY=#{Formula["jpeg"].opt_lib}/libjpeg.dylib",
	 "-DUSE_LAPACK=OFF",
	 "-DUSE_LIBUSB_1=OFF",
	 "-DUSE_OPENCV=ON",
	 "-DOpenCV_DIR=#{Formula["opencv"].opt_share}/OpenCV",
	 "-DUSE_PCL=OFF",
	 "-DUSE_PNG=ON",
	 "-DPNG_PNG_INCLUDE_DIR=#{Formula["libpng"].opt_include}",
	 "-DPNG_LIBRARY_RELEASE=#{Formula["libpng"].opt_lib}/libpng.dylib",
	 "-DUSE_PTHREAD=ON",
	 "-DPTHREAD_INCLUDE_DIR=#{sdk}/usr/include",
	 "-DPTHREAD_LIBRARY=/usr/lib/libpthread.dylib",
	 "-DUSE_PYLON=OFF",
	 "-DUSE_REALSENSE=OFF",
	 "-DUSE_REALSENSE2=OFF",
	 "-DUSE_X11=OFF",
	 "-DUSE_XML2=ON",
	 "-DXML2_INCLUDE_DIR=#{sdk}/usr/include/libxml2",
	 "-DXML2_LIBRARY=/usr/lib/libxml2.dylib",
	 "-DUSE_ZBAR=ON",
	 "-DZBAR_INCLUDE_DIRS=#{Formula["zbar"].opt_include}",
	 "-DZBAR_LIBRARIES=#{Formula["zbar"].opt_lib}/libzbar.dylib",
	 "-DUSE_ZLIB=ON",
	 "-DZLIB_INCLUDE_DIR=#{sdk}/usr/include",
	 "-DZLIB_LIBRARY_RELEASE=/usr/lib/libz.dylib",
	 "-DWITH_LAPACK=OFF",
	 *std_cmake_args
	 system "make", "install"
