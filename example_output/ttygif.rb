name :
	 Ttygif
homepage :
	 https://github.com/icholy/ttygif
url :
	 https://github.com/icholy/ttygif/archive/1.4.0.tar.gz
description :
	 Converts a ttyrec file into gif files
build_deps :
link_deps :
	 imagemagick
	 ttyrec
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
