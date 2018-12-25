name :
	 Libsndfile
homepage :
	 http://www.mega-nerd.com/libsndfile/
url :
	 http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz
description :
	 C library for files containing sampled sound
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 flac
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
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
