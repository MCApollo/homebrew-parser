name :
	 Mgba
homepage :
	 https://mgba.io/
url :
description :
	 Game Boy Advance emulator
build_deps :
	 cmake
	 pkg-config
link_deps :
	 ffmpeg
	 imagemagick
	 libepoxy
	 libpng
	 libzip
	 qt
	 sdl2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if MacOS.version <= :el_capitan
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 end
	 inreplace "src/platform/qt/CMakeLists.txt", "Applications", "."
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 rm bin/"mgba"
	 bin.write_exec_script "#{prefix}/mGBA.app/Contents/MacOS/mGBA"
