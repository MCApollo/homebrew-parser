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
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version <= :el_capitan
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
