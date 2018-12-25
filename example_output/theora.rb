name :
	 Theora
homepage :
	 https://www.theora.org/
url :
	 https://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.bz2
description :
	 Open video compression format
build_deps :
	 libtool
	 pkg-config
link_deps :
	 libogg
	 libvorbis
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cp Dir["#{Formula["libtool"].opt_share}/libtool/*/config.{guess,sub}"], buildpath
	 system "./autogen.sh" if build.head?
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-oggtest
	 --disable-vorbistest
	 --disable-examples
	 ]
	 args << "--disable-asm" if build.head?
	 system "./configure", *args
	 system "make", "install"
