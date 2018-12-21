name :
	 Pngxx
homepage :
	 https://www.nongnu.org/pngpp/
url :
	 https://savannah.nongnu.org/download/pngpp/png++-0.2.5.tar.gz
description :
	 C++ wrapper for libpng library
build_deps :
link_deps :
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "install"
