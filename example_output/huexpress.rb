name :
	 Huexpress
homepage :
	 https://github.com/kallisti5/huexpress
url :
	 https://github.com/kallisti5/huexpress/archive/3.0.4.tar.gz
description :
	 PC Engine emulator
build_deps :
	 pkg-config
	 scons
link_deps :
	 libvorbis
	 libzip
	 sdl2
	 sdl2_mixer
conflicts :
patches :
EOF_patch :
install :
	 scons
	 bin.install ["src/huexpress", "src/hucrc"]
