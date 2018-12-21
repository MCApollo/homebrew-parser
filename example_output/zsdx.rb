name :
	 Zsdx
homepage :
	 http://www.solarus-games.org/games/zelda-mystery-of-solarus-dx/
url :
	 https://github.com/christopho/zsdx/archive/zsdx-1.11.0.tar.gz
description :
	 Zelda Mystery of Solarus DX
build_deps :
	 cmake
link_deps :
	 solarus
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args, "-DSOLARUS_INSTALL_DATADIR=#{share}"
	 system "make", "install"
