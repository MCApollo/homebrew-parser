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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if MacOS.version <= :el_capitan
	 inreplace "contrib/libvpx/module.defs", /--disable-unit-tests/,
	 "\\0 --disable-avx512"
	 end
	 if MacOS.version >= :mojave
	 inreplace "contrib/libvpx/module.defs", "--target=x86_64-darwin11-gcc", "--target=x86_64-darwin14-gcc"
	 end
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-xcode",
	 "--disable-gtk"
	 system "make", "-C", "build"
	 system "make", "-C", "build", "install"
