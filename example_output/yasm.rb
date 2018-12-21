name :
	 Yasm
homepage :
	 https://yasm.tortall.net/
url :
	 https://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
description :
	 Modular BSD reimplementation of NASM
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --prefix=#{prefix}
	 --disable-python
	 ]
	 ENV.deparallelize
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make", "install"
