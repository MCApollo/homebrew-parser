name :
	 Apng2gif
homepage :
	 https://apng2gif.sourceforge.io/
url :
	 https://downloads.sourceforge.net/apng2gif/apng2gif-1.8-src.zip
description :
	 Convert APNG animations into animated GIF format
build_deps :
link_deps :
	 libpng
	 gcc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "apng2gif"
