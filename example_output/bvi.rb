name :
	 Bvi
homepage :
	 https://bvi.sourceforge.io
url :
	 https://downloads.sourceforge.net/bvi/bvi-1.4.0.src.tar.gz
description :
	 Vi-like binary file (hex) editor
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
