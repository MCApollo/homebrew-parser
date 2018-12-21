name :
	 Libmatroska
homepage :
	 https://www.matroska.org/
url :
	 https://dl.matroska.org/downloads/libmatroska/libmatroska-1.4.9.tar.xz
description :
	 Extensible, open standard container format for audio/video
build_deps :
	 cmake
link_deps :
	 libebml
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=YES", *std_cmake_args
	 system "make", "install"
