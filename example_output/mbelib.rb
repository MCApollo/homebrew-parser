name :
	 Mbelib
homepage :
	 https://github.com/szechyjs/mbelib
url :
	 https://github.com/szechyjs/mbelib/archive/v1.3.0.tar.gz
description :
	 P25 Phase 1 and ProVoice vocoder
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 system "make", "test"
	 system "make", "install"
	 end
