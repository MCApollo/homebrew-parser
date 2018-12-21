name :
	 Minetest
homepage :
	 https://www.minetest.net/
url :
	 https://github.com/minetest/minetest/archive/0.4.17.1.tar.gz
description :
	 Free, open source voxel game engine and game
build_deps :
	 cmake
link_deps :
	 freetype
	 gettext
	 irrlicht
	 jpeg
	 libogg
	 libvorbis
	 luajit
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"games/minetest_game").install resource("minetest_game")
	 args = std_cmake_args - %w[-DCMAKE_BUILD_TYPE=None]
	 args << "-DCMAKE_BUILD_TYPE=Release" << "-DBUILD_CLIENT=1" << "-DBUILD_SERVER=0"
	 args << "-DENABLE_FREETYPE=1" << "-DCMAKE_EXE_LINKER_FLAGS='-L#{Formula["freetype"].opt_lib}'"
	 args << "-DENABLE_GETTEXT=1" << "-DCUSTOM_GETTEXT_PATH=#{Formula["gettext"].opt_prefix}"
	 inreplace "src/CMakeLists.txt", "-ffast-math", ""
	 system "cmake", ".", *args
	 system "make", "package"
	 system "unzip", "minetest-*-osx.zip"
	 prefix.install "minetest.app"
