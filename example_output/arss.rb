name :
	 Arss
homepage :
	 https://arss.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/arss/arss/0.2.3/arss-0.2.3-src.tar.gz
description :
	 Analyze a sound file into a spectrogram
build_deps :
	 cmake
link_deps :
	 fftw
conflicts :
patches :
EOF_patch :
install :
	 cd "src" do
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 end
