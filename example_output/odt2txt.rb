name :
	 Odt2txt
homepage :
	 https://github.com/dstosberg/odt2txt/
url :
	 https://github.com/dstosberg/odt2txt/archive/v0.5.tar.gz
description :
	 Convert OpenDocument files to plain text
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "DESTDIR=#{prefix}"
