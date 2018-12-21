name :
	 Falcon
homepage :
	 http://www.falconpl.org/
url :
	 https://mirrorservice.org/sites/distfiles.macports.org/falcon/Falcon-0.9.6.8.tgz
description :
	 Multi-paradigm programming language and scripting engine
build_deps :
	 cmake
link_deps :
	 pcre
conflicts :
	 sdl
patches :
EOF_patch :
install :
	 args = std_cmake_args + %W[
	 -DFALCON_BIN_DIR=#{bin}
	 -DFALCON_LIB_DIR=#{lib}
	 -DFALCON_MAN_DIR=#{man1}
	 -DFALCON_WITH_EDITLINE=OFF
	 -DFALCON_WITH_FEATHERS=NO
	 -DFALCON_WITH_INTERNAL_PCRE=OFF
	 -DFALCON_WITH_MANPAGES=ON
	 ]
	 system "cmake", *args
	 system "make"
	 system "make", "install"
