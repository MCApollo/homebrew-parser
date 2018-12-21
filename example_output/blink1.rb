name :
	 Blink1
homepage :
	 https://blink1.thingm.com/
url :
	 https://github.com/todbot/blink1-tool.git
description :
	 Control blink(1) indicator light
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "blink1-tool"
	 lib.install "libBlink1.dylib"
	 include.install "blink1-lib.h"
