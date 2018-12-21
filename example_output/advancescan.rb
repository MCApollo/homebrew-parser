name :
	 Advancescan
homepage :
	 https://www.advancemame.it/scan-readme.html
url :
	 https://github.com/amadvance/advancescan/releases/download/v1.18/advancescan-1.18.tar.gz
description :
	 Rom manager for AdvanceMAME/MESS
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
