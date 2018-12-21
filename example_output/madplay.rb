name :
	 Madplay
homepage :
	 https://www.underbit.com/products/mad/
url :
	 https://downloads.sourceforge.net/project/mad/madplay/0.15.2b/madplay-0.15.2b.tar.gz
description :
	 MPEG Audio Decoder
build_deps :
link_deps :
	 libid3tag
	 mad
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/f6c5992c/madplay/patch-audio_carbon.c
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --mandir=#{man}
	 ]
	 args << "--build=#{Hardware::CPU.arch_64_bit}" if MacOS.prefer_64_bit?
	 system "./configure", *args
	 system "make", "install"
