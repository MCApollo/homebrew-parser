name :
	 Avanor
homepage :
	 https://avanor.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/avanor/avanor/0.5.8/avanor-0.5.8-src.tar.bz2
description :
	 Quick-growing roguelike game with easy ADOM-like UI
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://gist.githubusercontent.com/mistydemeo/64f47233ee64d55cb7d5/raw/c1847d7e3a134e6109ad30ce1968919dd962e727/avanor-clang.diff
EOF_patch :
install :
	 system "make", "DATA_DIR=#{pkgshare}/", "CC=#{ENV.cxx}", "LD=#{ENV.cxx}"
	 bin.install "avanor"
	 pkgshare.install "manual"
