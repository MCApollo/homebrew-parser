name :
	 Shorten
homepage :
	 https://web.archive.org/web/20180903155129/www.etree.org/shnutils/shorten/
url :
	 https://web.archive.org/web/20180903155129/www.etree.org/shnutils/shorten/dist/src/shorten-3.6.1.tar.gz
description :
	 Waveform compression
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
