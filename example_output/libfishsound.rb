name :
	 Libfishsound
homepage :
	 https://xiph.org/fishsound/
url :
	 https://downloads.xiph.org/releases/libfishsound/libfishsound-1.0.0.tar.gz
description :
	 Decode and encode audio data using the Xiph.org codecs
build_deps :
	 pkg-config
link_deps :
	 libvorbis
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
