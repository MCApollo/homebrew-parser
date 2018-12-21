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
conflicts :
patches :
EOF_patch :
install :
	 system "autoconf"
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
