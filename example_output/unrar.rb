name :
	 Unrar
homepage :
	 https://www.rarlab.com/
url :
	 https://www.rarlab.com/rar/unrarsrc-5.6.8.tar.gz
description :
	 Extract, view, and test RAR archives
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
	 inreplace "makefile", "libunrar.so", "libunrar.dylib"
	 system "make"
	 system "make", "clean"
	 system "make", "lib"
	 bin.install "unrar"
	 lib.install "libunrar.dylib"
