name :
	 Lastfmfpclient
homepage :
	 https://github.com/lastfm/Fingerprinter
url :
	 https://github.com/lastfm/Fingerprinter/archive/9ee83a51ac9058ff53c9.tar.gz
description :
	 Last.fm fingerprint library
build_deps :
	 cmake
link_deps :
	 fftw
	 libsamplerate
	 mad
	 taglib
conflicts :
patches :
EOF_patch :
install :
	 inreplace_fix
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
