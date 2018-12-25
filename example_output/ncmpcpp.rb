name :
	 Ncmpcpp
homepage :
	 https://rybczak.net/ncmpcpp/
url :
	 https://rybczak.net/ncmpcpp/stable/ncmpcpp-0.8.2.tar.bz2
description :
	 Ncurses-based client for the Music Player Daemon
build_deps :
	 pkg-config
link_deps :
	 boost
	 fftw
	 libmpdclient
	 ncurses
	 readline
	 taglib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV.append "LDFLAGS", "-liconv"
	 ENV.append "BOOST_LIB_SUFFIX", "-mt"
	 ENV.append "CXXFLAGS", "-D_XOPEN_SOURCE_EXTENDED"
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --enable-clock
	 --enable-outputs
	 --enable-unicode
	 --enable-visualizer
	 --with-curl
	 --with-taglib
	 ]
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "install"
