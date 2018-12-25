name :
	 OpencvAT2
homepage :
	 https://opencv.org/
url :
	 https://github.com/opencv/opencv/archive/2.4.13.7.tar.gz
description :
	 Open source computer vision library
build_deps :
	 cmake
	 pkg-config
link_deps :
	 eigen
	 ffmpeg
	 jpeg
	 libpng
	 libtiff
	 openexr
	 python@2
	 numpy
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 jpeg = Formula["jpeg"]
	 args = std_cmake_args + %W[
	 -DCMAKE_OSX_DEPLOYMENT_TARGET=
	 -DBUILD_JASPER=OFF
	 -DBUILD_JPEG=OFF
	 -DBUILD_OPENEXR=OFF
	 -DBUILD_PERF_TESTS=OFF
	 -DBUILD_PNG=OFF
	 -DBUILD_TESTS=OFF
	 -DBUILD_TIFF=OFF
	 -DBUILD_ZLIB=OFF
	 -DBUILD_opencv_java=OFF
	 -DWITH_CUDA=OFF
	 -DWITH_EIGEN=ON
	 -DWITH_FFMPEG=ON
	 -DWITH_GSTREAMER=OFF
	 -DWITH_JASPER=OFF
	 -DWITH_OPENEXR=ON
	 -DWITH_OPENGL=ON
	 -DWITH_TBB=OFF
	 -DJPEG_INCLUDE_DIR=#{jpeg.opt_include}
	 -DJPEG_LIBRARY=#{jpeg.opt_lib}/libjpeg.dylib
	 ]
	 args << "-DBUILD_opencv_python=" + (build.with?("python@2") ? "ON" : "OFF")
	 if build.with? "python@2"
	 py_prefix = `python-config --prefix`.chomp
	 py_lib = "#{py_prefix}/lib"
	 args << "-DPYTHON_LIBRARY=#{py_lib}/libpython2.7.dylib"
	 args << "-DPYTHON_INCLUDE_DIR=#{py_prefix}/include/python2.7"
	 args << "-DCMAKE_PREFIX_PATH=#{py_prefix}"
	 end
	 if ENV.compiler == :clang && !build.bottle?
	 args << "-DENABLE_SSSE3=ON" if Hardware::CPU.ssse3?
	 args << "-DENABLE_SSE41=ON" if Hardware::CPU.sse4?
	 args << "-DENABLE_SSE42=ON" if Hardware::CPU.sse4_2?
	 args << "-DENABLE_AVX=ON" if Hardware::CPU.avx?
	 end
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make"
	 system "make", "install"
	 end
