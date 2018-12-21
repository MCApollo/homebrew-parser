name :
	 Vc4asm
homepage :
	 http://maazl.de/project/vc4asm/doc/index.html
url :
	 https://github.com/maazl/vc4asm/archive/V0.2.3.tar.gz
description :
	 Macro assembler for Broadcom VideoCore IV aka Raspberry Pi GPU
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 inreplace "src/utils.cpp", "#include <unistd.h>",
	 "#include <unistd.h>\n#include <errno.h>"
	 (buildpath/"src").install resource("old_makefile")
	 system "make", "-C", "src"
	 bin.install "bin/vc4asm", "bin/vc4dis"
	 share.install "share/vc4.qinc"
