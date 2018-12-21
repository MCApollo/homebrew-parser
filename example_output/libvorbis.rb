name :
	 Libvorbis
homepage :
	 https://xiph.org/vorbis/
url :
	 https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.6.tar.xz
description :
	 Vorbis General Audio Compression Codec
build_deps :
	 pkg-config
link_deps :
	 libogg
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
