name :
	 Opencv
homepage :
	 https://opencv.org/
url :
	 https://github.com/opencv/opencv/archive/3.4.3.tar.gz
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
	 numpy
	 openexr
	 python
	 python@2
	 tbb
optional_deps :
conflicts :
resource :
	 ['contrib']
	 ['https://github.com/opencv/opencv_contrib/archive/3.4.3.tar.gz']
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV.prepend_path "PATH", Formula["python@2"].opt_libexec/"bin"
	 resource("contrib").stage buildpath/"opencv_contrib"
	 ENV.delete("PYTHONPATH")
	 py2_prefix = `python2-config --prefix`.chomp
	 py2_lib = "#{py2_prefix}/lib"
	 py3_config = `python3-config --configdir`.chomp
	 py3_include = `python3 -c "import distutils.sysconfig as s; print(s.get_python_inc())"`.chomp
	 py3_version = Language::Python.major_minor_version "python3"
	 args = std_cmake_args + %W[
	 -DCMAKE_OSX_DEPLOYMENT_TARGET=
	 -DBUILD_JASPER=OFF
	 -DBUILD_JPEG=ON
	 -DBUILD_OPENEXR=OFF
	 -DBUILD_PERF_TESTS=OFF
	 -DBUILD_PNG=OFF
	 -DBUILD_TESTS=OFF
	 -DBUILD_TIFF=OFF
	 -DBUILD_ZLIB=OFF
	 -DBUILD_opencv_hdf=OFF
	 -DBUILD_opencv_java=OFF
	 -DBUILD_opencv_text=OFF
	 -DOPENCV_ENABLE_NONFREE=ON
	 -DOPENCV_EXTRA_MODULES_PATH=#{buildpath}/opencv_contrib/modules
	 -DWITH_1394=OFF
	 -DWITH_CUDA=OFF
	 -DWITH_EIGEN=ON
	 -DWITH_FFMPEG=ON
	 -DWITH_GPHOTO2=OFF
	 -DWITH_GSTREAMER=OFF
	 -DWITH_JASPER=OFF
	 -DWITH_OPENEXR=ON
	 -DWITH_OPENGL=OFF
	 -DWITH_QT=OFF
	 -DWITH_TBB=ON
	 -DWITH_VTK=OFF
	 -DBUILD_opencv_python2=ON
	 -DBUILD_opencv_python3=ON
	 -DPYTHON2_EXECUTABLE=#{which "python"}
	 -DPYTHON2_LIBRARY=#{py2_lib}/libpython2.7.dylib
	 -DPYTHON2_INCLUDE_DIR=#{py2_prefix}/include/python2.7
	 -DPYTHON3_EXECUTABLE=#{which "python3"}
	 -DPYTHON3_LIBRARY=#{py3_config}/libpython#{py3_version}.dylib
	 -DPYTHON3_INCLUDE_DIR=#{py3_include}
	 ]
	 if build.bottle?
	 args += %w[-DENABLE_SSE41=OFF -DENABLE_SSE42=OFF -DENABLE_AVX=OFF
	 -DENABLE_AVX2=OFF]
	 end
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make"
	 system "make", "install"
	 system "make", "clean"
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=OFF", *args
	 system "make"
	 lib.install Dir["lib/*.a"]
	 lib.install Dir["3rdparty/**/*.a"]
	 end
