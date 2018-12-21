name :
	 LibunwindHeaders
homepage :
	 https://opensource.apple.com/
url :
	 https://opensource.apple.com/tarballs/libunwind/libunwind-35.3.tar.gz
description :
	 C API for determining the call-chain of a program
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 include.install Dir["include/*"]
	 (include/"libunwind").install Dir["src/*.h*"]
	 (include/"libunwind/libunwind_priv.h").unlink
