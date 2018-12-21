name :
	 Ezstream
homepage :
	 https://icecast.org/ezstream/
url :
	 https://downloads.xiph.org/releases/ezstream/ezstream-0.6.0.tar.gz
description :
	 Client for Icecast streaming servers
build_deps :
	 pkg-config
link_deps :
	 libogg
	 libshout
	 libvorbis
	 speex
	 theora
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
