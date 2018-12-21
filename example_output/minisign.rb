name :
	 Minisign
homepage :
	 https://jedisct1.github.io/minisign/
url :
	 https://github.com/jedisct1/minisign/archive/0.8.tar.gz
description :
	 Sign files & verify signatures. Works with signify in OpenBSD
build_deps :
	 cmake
link_deps :
	 libsodium
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make"
	 system "make", "install"
