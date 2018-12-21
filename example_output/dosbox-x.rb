name :
	 DosboxX
homepage :
	 http://dosbox-x.com/
url :
	 https://github.com/joncampbell123/dosbox-x/archive/v0.801.tar.gz
description :
	 DOSBox with accurate emulation and wide testing
build_deps :
link_deps :
	 fluid-synth
	 libpng
	 sdl
	 sdl_net
	 sdl_sound
conflicts :
	 dosbox
patches :
EOF_patch :
install :
	 ENV.cxx11
	 inreplace "src/hardware/ne2000.cpp", "#define HAVE_REMOTE\n", ""
	 if DevelopmentTools.clang_build_version >= 900
	 inreplace "src/hardware/serialport/nullmodem.cpp",
	 "setCD(clientsocket > 0)", "setCD(clientsocket != 0)"
