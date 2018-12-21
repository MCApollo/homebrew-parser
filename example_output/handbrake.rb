name :
	 Handbrake
homepage :
	 https://handbrake.fr/
url :
	 https://download.handbrake.fr/releases/1.1.2/HandBrake-1.1.2-source.tar.bz2
description :
	 Open-source video transcoder available for Linux, Mac, and Windows
build_deps :
	 autoconf
	 automake
	 cmake
	 libtool
	 nasm
	 pkg-config
	 python@2
	 yasm
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version <= :el_capitan
	 inreplace "contrib/libvpx/module.defs", /--disable-unit-tests/,
	 "\\0 --disable-avx512"
