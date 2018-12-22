name :
	 Openimageio
homepage :
	 http://openimageio.org/
url :
	 https://github.com/OpenImageIO/oiio/archive/Release-1.8.17.tar.gz
description :
	 Library for reading, processing and writing images
build_deps :
	 cmake
	 pkg-config
link_deps :
	 boost
	 boost-python
	 boost-python3
	 ffmpeg
	 freetype
	 giflib
	 ilmbase
	 jpeg
	 libpng
	 libraw
	 libtiff
	 opencolorio
	 openexr
	 python
	 webp
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %w[
	 -DEMBEDPLUGINS=ON
	 -DUSE_FIELD3D=OFF
	 -DUSE_JPEGTURBO=OFF
	 -DUSE_NUKE=OFF
	 -DUSE_OPENCV=OFF
	 -DUSE_OPENGL=OFF
	 -DUSE_OPENJPEG=OFF
	 -DUSE_OPENSSL=OFF
	 -DUSE_PTEX=OFF
	 -DUSE_QT=OFF
	 ]
	 mkdir "build-with-python2" do
	 system "cmake", "..", "-DBoost_PYTHON_LIBRARIES=#{Formula["boost-python"].opt_lib}/libboost_python27-mt.dylib",
	 *args
	 system "make", "install"
	 end
	 py3ver = Language::Python.major_minor_version "python3"
	 py3prefix = Formula["python3"].opt_frameworks/"Python.framework/Versions/#{py3ver}"
	 ENV["PYTHONPATH"] = lib/"python#{py3ver}/site-packages"
	 args << "-DPYTHON_EXECUTABLE=#{py3prefix}/bin/python3"
	 args << "-DPYTHON_LIBRARY=#{py3prefix}/lib/libpython#{py3ver}.dylib"
	 args << "-DPYTHON_INCLUDE_DIR=#{py3prefix}/include/python#{py3ver}m"
	 args << "-DBOOST_ROOT=#{Formula["boost"].opt_prefix}"
	 args << "-DBoost_PYTHON_LIBRARIES=#{Formula["boost-python3"].opt_lib}/libboost_python#{py3ver.to_s.delete(".")}-mt.dylib"
	 args << "-DBoost_PYTHON_LIBRARY_DEBUG=''"
	 args << "-DBoost_PYTHON_LIBRARY_RELEASE=''"
	 mkdir "build-with-python3" do
	 system "cmake", "..", *args
	 system "make", "install"
	 end
