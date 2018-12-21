name :
	 Inspectrum
homepage :
	 https://github.com/miek/inspectrum
url :
	 https://github.com/miek/inspectrum/archive/v0.2.2.tar.gz
description :
	 Offline radio signal analyser
build_deps :
	 cmake
	 pkg-config
link_deps :
	 fftw
	 liquid-dsp
	 qt
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
