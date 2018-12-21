name :
	 Instead
homepage :
	 https://instead.syscall.ru/
url :
	 https://github.com/instead-hub/instead/archive/3.2.2.tar.gz
description :
	 Interpreter of simple text adventures
build_deps :
	 cmake
link_deps :
	 lua
	 sdl2
	 sdl2_image
	 sdl2_mixer
	 sdl2_ttf
conflicts :
patches :
	 https://github.com/instead-hub/instead/commit/e00be1e2.patch?full_index=1
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DWITH_GTK2=OFF",
	 "-DLUA_INCLUDE_DIR=#{Formula["lua"].opt_include}/lua",
	 "-DLUA_LIBRARY=#{Formula["lua"].opt_lib}/liblua.dylib",
	 *std_cmake_args
	 system "make", "install"
