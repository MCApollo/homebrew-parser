name :
	 Liblinear
homepage :
	 https://www.csie.ntu.edu.tw/~cjlin/liblinear/
url :
	 https://www.csie.ntu.edu.tw/~cjlin/liblinear/oldfiles/liblinear-2.20.tar.gz
description :
	 Library for large linear classification
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/941ec0ad/liblinear/patch-Makefile.diff
EOF_patch :
install :
	 system "make", "all"
	 bin.install "predict", "train"
	 lib.install "liblinear.dylib"
	 lib.install_symlink "liblinear.dylib" => "liblinear.1.dylib"
	 include.install "linear.h"
