name :
	 Gmic
homepage :
	 https://gmic.eu/
url :
	 https://gmic.eu/files/source/gmic_2.1.5.tar.gz
description :
	 Full-Featured Open-Source Framework for Image Processing
build_deps :
	 cmake
link_deps :
	 fftw
	 jpeg
	 libpng
optional_deps :
	 ffmpeg
	 libtiff
	 opencv@2
	 openexr
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cp "resources/CMakeLists.txt", buildpath
	 args = std_cmake_args
	 args << "-DENABLE_X=OFF"
	 args << "-DENABLE_FFMPEG=OFF" if build.without? "ffmpeg"
	 args << "-DENABLE_OPENCV=OFF" if build.without? "opencv"
	 args << "-DENABLE_OPENEXR=OFF" if build.without? "openexr"
	 args << "-DENABLE_TIFF=OFF" if build.without? "libtiff"
	 system "cmake", *args
	 system "make", "install"
