name :
	 Tiff2png
homepage :
	 http://www.libpng.org/pub/png/apps/tiff2png.html
url :
	 https://github.com/rillian/tiff2png/archive/v0.92.tar.gz
description :
	 TIFF to PNG converter
build_deps :
link_deps :
	 jpeg
	 libpng
	 libtiff
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.mkpath
	 system "make", "INSTALL=#{prefix}", "CC=#{ENV.cc}", "install"
