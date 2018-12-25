name :
	 X264
homepage :
	 https://www.videolan.org/developers/x264.html
url :
description :
	 H.264/AVC encoder
build_deps :
	 nasm
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-lsmash
	 --enable-shared
	 --enable-static
	 --enable-strip
	 ]
	 args << "--bit-depth=10" if build.stable? && build.with?("10-bit")
	 system "./configure", *args
	 system "make", "install"
