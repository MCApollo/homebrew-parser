name :
	 Minimodem
homepage :
	 http://www.whence.com/minimodem/
url :
	 http://www.whence.com/minimodem/minimodem-0.24.tar.gz
description :
	 General-purpose software audio FSK modem
build_deps :
	 pkg-config
link_deps :
	 fftw
	 libsndfile
	 pulseaudio
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-alsa"
	 system "make", "install"
