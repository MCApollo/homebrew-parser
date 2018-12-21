name :
	 Libsvm
homepage :
	 https://www.csie.ntu.edu.tw/~cjlin/libsvm/
url :
	 https://www.csie.ntu.edu.tw/~cjlin/libsvm/libsvm-3.22.tar.gz
description :
	 Library for support vector machines
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CFLAGS=#{ENV.cflags}"
	 system "make", "lib"
	 bin.install "svm-scale", "svm-train", "svm-predict"
	 lib.install "libsvm.so.2" => "libsvm.2.dylib"
	 lib.install_symlink "libsvm.2.dylib" => "libsvm.dylib"
	 MachO::Tools.change_dylib_id("#{lib}/libsvm.2.dylib", "#{lib}/libsvm.2.dylib")
	 include.install "svm.h"
