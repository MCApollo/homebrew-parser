name :
	 CdogsSdl
homepage :
	 https://cxong.github.io/cdogs-sdl/
url :
	 https://github.com/cxong/cdogs-sdl/archive/0.6.2.tar.gz
description :
	 Classic overhead run-and-gun game
build_deps :
	 cmake
	 pkg-config
link_deps :
	 sdl2
	 sdl2_image
	 sdl2_mixer
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DCDOGS_DATA_DIR=#{pkgshare}/"
	 system "cmake", ".", *args
	 system "make"
	 prefix.install "src/cdogs-sdl.app"
	 bin.write_exec_script "#{prefix}/cdogs-sdl.app/Contents/MacOS/cdogs-sdl"
	 pkgshare.install %w[data dogfights graphics missions music sounds]
	 doc.install Dir["doc/*"]
