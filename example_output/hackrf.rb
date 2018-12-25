name :
	 Hackrf
homepage :
	 https://github.com/mossmann/hackrf
url :
	 https://github.com/mossmann/hackrf/archive/v2018.01.1.tar.gz
description :
	 Low cost software radio platform
build_deps :
	 cmake
	 pkg-config
link_deps :
	 fftw
	 libusb
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "host" do
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 end
