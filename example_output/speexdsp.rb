name :
	 Speexdsp
homepage :
	 https://github.com/xiph/speexdsp
url :
	 https://github.com/xiph/speexdsp/archive/SpeexDSP-1.2rc3.tar.gz
description :
	 Speex audio processing library
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
