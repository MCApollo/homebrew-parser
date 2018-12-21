name :
	 Dsd
homepage :
	 https://wiki.radioreference.com/index.php/Digital_Speech_Decoder_%28software_package%29
url :
	 https://github.com/szechyjs/mbelib/archive/v1.2.5.tar.gz
description :
	 Decoder for several digital speech formats
build_deps :
	 cmake
link_deps :
	 itpp
	 libsndfile
	 portaudio
conflicts :
patches :
EOF_patch :
install :
	 resource("mbelib-1.2.5").stage do
	 inreplace "CMakeLists.txt",
	 "install(TARGETS mbe-static mbe-shared DESTINATION lib)",
	 "install(TARGETS mbe-static DESTINATION lib)"
	 args = std_cmake_args
	 args << "-DCMAKE_INSTALL_PREFIX=#{buildpath}/vendor/mbelib"
	 system "cmake", ".", *args
	 system "make", "install"
