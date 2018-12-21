name :
	 Yamcha
homepage :
	 http://chasen.org/~taku/software/yamcha/
url :
	 http://chasen.org/~taku/software/yamcha/src/yamcha-0.33.tar.gz
description :
	 NLP text chunker using Support Vector Machines
build_deps :
link_deps :
	 tinysvm
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
