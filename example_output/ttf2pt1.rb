name :
	 Ttf2pt1
homepage :
	 https://ttf2pt1.sourceforge.io/
url :
	 https://downloads.sourceforge.net/ttf2pt1/ttf2pt1-3.4.4.tgz
description :
	 True Type Font to Postscript Type 1 converter
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "all", "INSTDIR=#{prefix}"
	 bin.install "ttf2pt1"
	 man1.install "ttf2pt1.1"
