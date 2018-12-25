name :
	 Shakespeare
homepage :
	 https://shakespearelang.sourceforge.io/
url :
	 https://shakespearelang.sourceforge.io/download/spl-1.2.1.tar.gz
description :
	 Write programs in Shakespearean English
build_deps :
link_deps :
	 flex
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install"
	 bin.install "spl/bin/spl2c"
	 include.install "spl/include/spl.h"
	 lib.install "spl/lib/libspl.a"
