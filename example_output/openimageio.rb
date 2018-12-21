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
