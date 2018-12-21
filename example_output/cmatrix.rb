name :
	 Cmatrix
homepage :
	 https://www.asty.org/cmatrix/
url :
	 https://www.asty.org/cmatrix/dist/cmatrix-1.2a.tar.gz
description :
	 Console Matrix
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make"
	 system "make", "install"
