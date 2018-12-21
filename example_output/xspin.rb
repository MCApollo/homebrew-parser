name :
	 Xspin
homepage :
	 https://spinroot.com/spin/Src/index.html
url :
	 https://spinroot.com/spin/Src/xspin525.tcl
description :
	 Software verification tool (developed at Bell Labs)
build_deps :
link_deps :
	 spin
conflicts :
patches :
EOF_patch :
	 diff --git a/xspin525.tcl b/xspin525.tcl
	 old mode 100644
	 new mode 100755
	 index 73fc6bf..444b0ad
	 --- a/xspin525.tcl
	 +++ b/xspin525.tcl
	 @@ -1,8 +1,9 @@
	 -#!/bin/sh
	 +#!/usr/bin/wish -f
	 -exec wish c:/cygwin/bin/xspin -- $*
	 +exec wish CELLAR/bin/xspin -- $*
	 +
	 + cd	;
	 -
install :
	 inreplace "xspin525.tcl", "CELLAR", prefix
	 bin.install "xspin525.tcl" => "xspin"
