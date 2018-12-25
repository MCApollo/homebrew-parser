name :
	 Psftools
homepage :
	 https://www.seasip.info/Unix/PSF/
url :
	 https://www.seasip.info/Unix/PSF/psftools-1.1.10.tar.gz
description :
	 Tools for fixed-width bitmap fonts
build_deps :
	 autoconf
link_deps :
optional_deps :
conflicts :
resource :
	 ['pc8x8font']
	 ['https://www.zone38.net/font/pc8x8.zip']
patches :
EOF_patch :
install :
	 system "autoconf"
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
