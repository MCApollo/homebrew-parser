name :
	 Shntool
homepage :
	 https://web.archive.org/web/20180903160820/etree.org/shnutils/shntool/
url :
	 https://web.archive.org/web/20180903160820/etree.org/shnutils/shntool/dist/src/shntool-3.0.10.tar.gz
description :
	 Multi-purpose tool for manipulating and analyzing WAV files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
