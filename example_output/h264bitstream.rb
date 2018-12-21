name :
	 H264bitstream
homepage :
	 https://h264bitstream.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/h264bitstream/h264bitstream/0.1.9/h264bitstream-0.1.9.tar.gz
description :
	 Library for reading and writing H264 video streams
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
