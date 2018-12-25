name :
	 Pc6001vx
homepage :
	 http://eighttails.seesaa.net/
url :
	 http://eighttails.up.seesaa.net/bin/PC6001VX_3.0.0_src.tar.gz
description :
	 PC-6001 emulator
build_deps :
	 pkg-config
link_deps :
	 ffmpeg
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
	 ENV.append_to_cflags "-I#{Formula["sdl2"].opt_include}"
	 ENV.append_to_cflags "-I#{Formula["ffmpeg"].opt_include}"
	 ENV.append_to_cflags "-Wno-reserved-user-defined-literal"
	 ENV.append_to_cflags "-stdlib=libc++" if ENV.compiler == :clang
	 system "qmake", "PREFIX=#{prefix}", "QMAKE_CXXFLAGS=#{ENV.cxxflags}", "CONFIG+=c++11"
	 system "make"
	 prefix.install "PC6001VX.app"
	 bin.write_exec_script "#{prefix}/PC6001VX.app/Contents/MacOS/PC6001VX"
