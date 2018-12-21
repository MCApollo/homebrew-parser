name :
	 Libreplaygain
homepage :
	 https://www.musepack.net/
url :
	 https://files.musepack.net/source/libreplaygain_r475.tar.gz
description :
	 Library to implement ReplayGain standard for audio
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 include.install "include/replaygain/"
