name :
	 Kvazaar
homepage :
	 https://github.com/ultravideo/kvazaar
url :
	 https://github.com/ultravideo/kvazaar/releases/download/v1.2.0/kvazaar-1.2.0.tar.xz
description :
	 Ultravideo HEVC encoder
build_deps :
	 yasm
link_deps :
optional_deps :
conflicts :
resource :
	 ['videosample']
	 ['https://samples.mplayerhq.hu/V-codecs/lm20.avi']
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
