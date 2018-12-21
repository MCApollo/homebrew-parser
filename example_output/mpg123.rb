name :
	 Mpg123
homepage :
	 https://www.mpg123.de/
url :
	 https://downloads.sourceforge.net/project/mpg123/mpg123/1.25.10/mpg123-1.25.10.tar.bz2
description :
	 MP3 player for Linux and UNIX
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --with-default-audio=coreaudio
	 --with-module-suffix=.so
	 ]
	 if MacOS.prefer_64_bit?
	 args << "--with-cpu=x86-64"
	 else
	 args << "--with-cpu=sse_alone"
