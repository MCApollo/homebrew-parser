name :
	 Pdf2svg
homepage :
	 http://www.cityinthesky.co.uk/opensource/pdf2svg
url :
	 https://github.com/db9052/pdf2svg/archive/v0.2.3.tar.gz
description :
	 PDF converter to SVG
build_deps :
	 pkg-config
link_deps :
	 cairo
	 poppler
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
