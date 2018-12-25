name :
	 Advancecomp
homepage :
	 https://www.advancemame.it/comp-readme.html
url :
	 https://github.com/amadvance/advancecomp/releases/download/v2.1/advancecomp-2.1.tar.gz
description :
	 Recompression utilities for .PNG, .MNG, .ZIP, and .GZ files
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--enable-bzip2", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
