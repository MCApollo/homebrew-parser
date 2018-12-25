name :
	 Mjpegtools
homepage :
	 https://mjpeg.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/mjpeg/mjpegtools/2.1.0/mjpegtools-2.1.0.tar.gz
description :
	 Record and playback videos and perform simple edits
build_deps :
	 pkg-config
link_deps :
	 jpeg
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--enable-simd-accel",
	 "--prefix=#{prefix}"
	 system "make", "install"
