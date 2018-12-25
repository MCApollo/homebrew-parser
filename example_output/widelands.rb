name :
	 Widelands
homepage :
	 https://wl.widelands.org/
url :
	 https://launchpad.net/widelands/build19/build19/+download/widelands-build19-src.tar.bz2
description :
	 Free real-time strategy game like Settlers II
build_deps :
	 cmake
link_deps :
	 boost
	 doxygen
	 gettext
	 glew
	 icu4c
	 libpng
	 lua
	 minizip
	 sdl2_image
	 sdl2_mixer
	 sdl2_net
	 sdl2_ttf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "CXXFLAGS", "-DU_USING_ICU_NAMESPACE=1"
	 ENV.cxx11
	 mkdir "build" do
	 system "cmake", "..",
	 "-DPNG_PNG_INCLUDE_DIR:PATH=#{Formula["libpng"].opt_include}",
	 "-DWL_INSTALL_DATADIR=#{pkgshare}/data",
	 *std_cmake_args
	 system "make", "install"
	 (bin/"widelands").write <<~EOS
	 #!/bin/sh
	 exec #{prefix}/widelands "$@"
	 EOS
	 end
