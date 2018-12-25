name :
	 Svdlibc
homepage :
	 https://tedlab.mit.edu/~dr/SVDLIBC/
url :
	 https://tedlab.mit.edu/~dr/SVDLIBC/svdlibc.tgz
description :
	 C library to perform singular value decomposition
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
	 system "make", "HOSTTYPE=target"
	 include.install "svdlib.h"
	 lib.install "target/libsvd.a"
	 bin.install "target/svd"
