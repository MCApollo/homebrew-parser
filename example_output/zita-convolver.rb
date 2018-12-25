name :
	 ZitaConvolver
homepage :
	 https://kokkinizita.linuxaudio.org/linuxaudio/
url :
	 https://kokkinizita.linuxaudio.org/linuxaudio/downloads/zita-convolver-4.0.0.tar.bz2
description :
	 Fast, partitioned convolution engine library
build_deps :
link_deps :
	 fftw
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "libs" do
	 system "make", "-f", "Makefile-osx", "install", "PREFIX=#{prefix}", "SUFFIX="
	 end
