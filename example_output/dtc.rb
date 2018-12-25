name :
	 Dtc
homepage :
	 https://www.devicetree.org/
url :
	 https://www.kernel.org/pub/software/utils/dtc/dtc-1.4.7.tar.xz
description :
	 Device tree compiler
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
	 system "make", "NO_PYTHON=1"
	 system "make", "NO_PYTHON=1", "DESTDIR=#{prefix}", "PREFIX=", "install"
	 mv lib/"libfdt.dylib.1", lib/"libfdt.1.dylib"
