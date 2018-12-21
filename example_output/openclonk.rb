name :
	 Openclonk
homepage :
	 https://www.openclonk.org/
url :
	 https://www.openclonk.org/builds/release/7.0/openclonk-7.0-src.tar.bz2
description :
	 Multiplayer action game
build_deps :
	 cmake
link_deps :
	 boost
	 freealut
	 freetype
	 glew
	 jpeg
	 libogg
	 libpng
	 libvorbis
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", *std_cmake_args
	 system "make"
	 system "make", "install"
	 bin.write_exec_script "#{prefix}/openclonk.app/Contents/MacOS/openclonk"
	 bin.install Dir[prefix/"c4*"]
