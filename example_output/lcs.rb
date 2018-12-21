name :
	 Lcs
homepage :
	 https://sourceforge.net/projects/lcsgame/
url :
	 738
description :
	 Satirical console-based political role-playing/strategy game
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap"
	 system "./configure", "LIBS=-liconv", "--prefix=#{prefix}"
	 system "make", "install"
