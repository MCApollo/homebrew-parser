name :
	 Byacc
homepage :
	 https://invisible-island.net/byacc/
url :
	 https://invisible-mirror.net/archives/byacc/byacc-20180609.tgz
description :
	 (Arguably) the best yacc variant
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--program-prefix=b", "--prefix=#{prefix}", "--man=#{man}"
	 system "make", "install"
