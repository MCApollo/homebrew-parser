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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make"
	 system "make", "install"
