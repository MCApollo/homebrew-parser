name :
	 Bgrep
homepage :
	 https://github.com/tmbinc/bgrep
url :
	 https://github.com/tmbinc/bgrep/archive/bgrep-0.2.tar.gz
description :
	 Like grep but for binary strings
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
	 system ENV.cc, ENV.cflags, "-o", "bgrep", "bgrep.c"
	 bin.install "bgrep"
