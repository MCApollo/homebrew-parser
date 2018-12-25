name :
	 Ppsspp
homepage :
	 https://ppsspp.org/
url :
	 https://github.com/hrydgard/ppsspp.git
description :
	 PlayStation Portable emulator
build_deps :
	 cmake
	 pkg-config
link_deps :
	 ffmpeg
	 glew
	 libzip
	 sdl2
	 snappy
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DUSE_SYSTEM_FFMPEG=ON"
	 ENV.append_to_cflags "-I#{Formula["libzip"].opt_prefix}/lib/libzip/include"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make"
	 prefix.install "PPSSPPSDL.app"
	 bin.write_exec_script "#{prefix}/PPSSPPSDL.app/Contents/MacOS/PPSSPPSDL"
	 mv "#{bin}/PPSSPPSDL", "#{bin}/ppsspp"
	 end
