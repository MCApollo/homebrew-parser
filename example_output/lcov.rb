name :
	 Lcov
homepage :
	 https://github.com/linux-test-project/lcov
url :
	 https://downloads.sourceforge.net/ltp/lcov-1.13.tar.gz
description :
	 Graphical front-end for GCC's coverage testing tool (gcov)
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
	 inreplace %w[bin/genhtml bin/geninfo bin/lcov],
	 "/etc/lcovrc", "#{prefix}/etc/lcovrc"
	 system "make", "PREFIX=#{prefix}", "BIN_DIR=#{bin}", "MAN_DIR=#{man}", "install"
