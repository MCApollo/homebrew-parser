name :
	 Sng
homepage :
	 https://sng.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/sng/sng-1.1.0.tar.gz
description :
	 Enable lossless editing of PNGs via a textual representation
build_deps :
link_deps :
	 libpng
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
