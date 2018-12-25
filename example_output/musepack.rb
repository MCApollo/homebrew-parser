name :
	 Musepack
homepage :
	 https://www.musepack.net/
url :
	 https://files.musepack.net/source/musepack_src_r475.tar.gz
description :
	 Audio compression format and tools
build_deps :
	 cmake
link_deps :
	 libcuefile
	 libreplaygain
optional_deps :
conflicts :
resource :
	 ['test-mpc']
	 ['https://trac.ffmpeg.org/raw-attachment/ticket/1160/decodererror.mpc']
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 lib.install "libmpcdec/libmpcdec.dylib"
