name :
	 Supertux
homepage :
	 https://www.supertux.org/
url :
	 https://github.com/SuperTux/supertux/releases/download/v0.5.1/SuperTux-v0.5.1-Source.tar.gz
description :
	 Classic 2D jump'n run sidescroller game
build_deps :
	 boost
	 cmake
	 pkg-config
link_deps :
	 glew
	 libogg
	 libvorbis
	 sdl2
	 sdl2_image
	 sdl2_mixer
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/SuperTux/supertux/commit/47a353e2981161e2da12492822fe88d797af2fec.diff?full_index=1
	 https://raw.githubusercontent.com/Homebrew/formula-patches/834e41a/supertux/squirrel_xcode9.patch
EOF_patch :
install :
	 ENV.cxx11
	 args = std_cmake_args
	 args << "-DINSTALL_SUBDIR_BIN=bin"
	 args << "-DINSTALL_SUBDIR_SHARE=share/supertux"
	 args << "-DPNG_PNG_INCLUDE_DIR=#{Formula["libpng"].opt_include}"
	 system "cmake", ".", *args
	 system "make", "install"
	 (share/"appdata").rmtree
	 (share/"applications").rmtree
	 (share/"pixmaps").rmtree
	 (prefix/"MacOS").rmtree
