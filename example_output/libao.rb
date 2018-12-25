name :
	 Libao
homepage :
	 https://www.xiph.org/ao/
url :
	 https://github.com/xiph/libao/archive/1.2.2.tar.gz
description :
	 Cross-platform Audio Library
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
optional_deps :
	 pulseaudio
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["AUTOMAKE_FLAGS"] = "--include-deps"
	 system "./autogen.sh"
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --enable-static
	 ]
	 args << "--enable-pulse" if build.with? "pulseaudio"
	 system "./configure", *args
	 system "make", "install"
