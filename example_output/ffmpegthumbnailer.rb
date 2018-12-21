name :
	 Ffmpegthumbnailer
homepage :
	 https://github.com/dirkvdb/ffmpegthumbnailer
url :
	 https://github.com/dirkvdb/ffmpegthumbnailer/releases/download/2.2.0/ffmpegthumbnailer-2.2.0.tar.bz2
description :
	 Create thumbnails for your video files
build_deps :
	 cmake
	 pkg-config
link_deps :
	 ffmpeg
	 jpeg
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11 if MacOS.version < :mavericks
	 args = std_cmake_args
	 args << "-DENABLE_GIO=ON"
	 args << "-DENABLE_THUMBNAILER=ON"
	 system "cmake", *args
	 system "make"
	 system "make", "install"
