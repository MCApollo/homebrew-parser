name :
	 Mp3gain
homepage :
	 https://mp3gain.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/mp3gain/mp3gain/1.6.2/mp3gain-1_6_2-src.zip
description :
	 Lossless mp3 normalizer with statistical analysis
build_deps :
link_deps :
	 mpg123
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "mp3gain"
