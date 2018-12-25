name :
	 Bibutils
homepage :
	 https://sourceforge.net/p/bibutils/home/Bibutils/
url :
	 https://downloads.sourceforge.net/project/bibutils/bibutils_6.7_src.tgz
description :
	 Bibliography conversion utilities
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
	 system "./configure", "--install-dir", bin,
	 "--install-lib", lib
	 system "make", "install", "CC=#{ENV.cc}"
