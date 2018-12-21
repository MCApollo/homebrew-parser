name :
	 LiquidDsp
homepage :
	 http://liquidsdr.org/
url :
	 https://github.com/jgaeddert/liquid-dsp/archive/v1.3.1.tar.gz
description :
	 Digital signal processing library for software-defined radios
build_deps :
	 autoconf
	 automake
link_deps :
	 fftw
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap.sh"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
