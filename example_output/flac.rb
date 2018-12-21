name :
	 Flac
homepage :
	 https://xiph.org/flac/
url :
	 https://downloads.xiph.org/releases/flac/flac-1.3.2.tar.xz
description :
	 Free lossless audio codec
build_deps :
	 pkg-config
link_deps :
	 libogg
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-debug
	 --prefix=#{prefix}
	 --enable-static
	 ]
	 args << "--disable-asm-optimizations" if Hardware::CPU.is_32_bit?
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make", "install"
