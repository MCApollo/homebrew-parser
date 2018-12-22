name :
	 Liblastfm
homepage :
	 https://github.com/lastfm/liblastfm/
url :
	 https://github.com/lastfm/liblastfm/archive/1.0.9.tar.gz
description :
	 Libraries for Last.fm site services
build_deps :
	 cmake
	 pkg-config
link_deps :
	 fftw
	 libsamplerate
	 qt
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 cd "tests" do
	 system "make"
	 end
	 share.install "tests"
	 end
