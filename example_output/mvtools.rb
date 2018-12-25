name :
	 Mvtools
homepage :
	 https://github.com/dubhater/vapoursynth-mvtools
url :
	 https://github.com/dubhater/vapoursynth-mvtools/archive/v20.tar.gz
description :
	 Filters for motion estimation and compensation
build_deps :
	 autoconf
	 automake
	 libtool
	 nasm
	 pkg-config
link_deps :
	 fftw
	 :macos
	 vapoursynth
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
