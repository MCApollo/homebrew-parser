name :
	 Libshout
homepage :
	 https://icecast.org/
url :
	 https://downloads.xiph.org/releases/libshout/libshout-2.4.1.tar.gz
description :
	 Data and connectivity library for the icecast server
build_deps :
	 pkg-config
link_deps :
	 libogg
	 libvorbis
	 speex
	 theora
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
