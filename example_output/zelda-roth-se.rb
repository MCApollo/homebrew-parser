name :
	 ZeldaRothSe
homepage :
	 http://www.solarus-games.org/games/zelda-return-of-the-hylian-se/
url :
description :
	 Zelda Return of the Hylian SE
build_deps :
	 cmake
link_deps :
	 solarus
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args, "-DSOLARUS_INSTALL_DATADIR=#{share}"
	 system "make", "install"
