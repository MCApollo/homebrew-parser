name :
	 Pngcheck
homepage :
	 http://www.libpng.org/pub/png/apps/pngcheck.html
url :
	 https://downloads.sourceforge.net/project/png-mng/pngcheck/2.3.0/pngcheck-2.3.0.tar.gz
description :
	 Print info and check PNG, JNG, and MNG files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "-f", "Makefile.unx", "ZINC=", "ZLIB=-lz"
	 bin.install %w[pngcheck pngsplit png-fix-IDAT-windowsize]
