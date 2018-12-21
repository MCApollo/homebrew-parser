name :
	 Flif
homepage :
	 https://flif.info/
url :
	 https://github.com/FLIF-hub/FLIF/archive/v0.3.tar.gz
description :
	 Free Loseless Image Format
build_deps :
	 pkg-config
link_deps :
	 libpng
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "install", "install-dev"
	 doc.install "doc/flif.pdf"
