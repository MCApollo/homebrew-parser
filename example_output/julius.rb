name :
	 Julius
homepage :
	 https://github.com/julius-speech/julius
url :
	 https://github.com/julius-speech/julius/archive/v4.4.2.1.tar.gz
description :
	 Two-pass large vocabulary continuous speech recognition engine
build_deps :
link_deps :
	 libsndfile
conflicts :
patches :
	 https://github.com/julius-speech/julius/pull/73.patch?full_index=1
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--mandir=#{man}",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
