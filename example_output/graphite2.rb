name :
	 Graphite2
homepage :
	 https://graphite.sil.org/
url :
	 https://github.com/silnrsi/graphite/releases/download/1.3.12/graphite2-1.3.12.tgz
description :
	 Smart font renderer for non-Roman scripts
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", *std_cmake_args
	 system "make", "install"
