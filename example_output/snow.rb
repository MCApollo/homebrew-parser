name :
	 Snow
homepage :
	 http://www.darkside.com.au/snow/
url :
	 https://dl.bintray.com/homebrew/mirror/snow-20130616.tar.gz
description :
	 Whitespace steganography: coded messages using whitespace
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "snow"
	 man1.install "snow.1"
