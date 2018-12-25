name :
	 Itpp
homepage :
	 https://itpp.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/itpp/itpp/4.3.1/itpp-4.3.1.tar.bz2
description :
	 Library of math, signal, and communication classes and functions
build_deps :
	 cmake
link_deps :
	 fftw
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "build" do
	 args = std_cmake_args
	 args.delete "-DCMAKE_BUILD_TYPE=None"
	 args << "-DCMAKE_BUILD_TYPE=Release"
	 system "cmake", "..", *args
	 system "make"
	 system "make", "install"
	 end
