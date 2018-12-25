name :
	 Ffms2
homepage :
	 https://github.com/FFMS/ffms2
url :
	 https://github.com/FFMS/ffms2/archive/2.23.tar.gz
description :
	 Libav/ffmpeg based source library and Avisynth plugin
build_deps :
	 pkg-config
link_deps :
	 ffmpeg
optional_deps :
conflicts :
resource :
	 ['videosample']
	 ['https://samples.mplayerhq.hu/V-codecs/lm20.avi']
patches :
EOF_patch :
install :
	 ENV.libcxx
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --enable-avresample
	 --prefix=#{prefix}
	 ]
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
