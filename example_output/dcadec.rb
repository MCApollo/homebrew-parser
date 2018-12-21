name :
	 Dcadec
homepage :
	 https://github.com/foo86/dcadec
url :
	 https://github.com/foo86/dcadec.git
description :
	 DTS Coherent Acoustics decoder with support for HD extensions
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "all"
	 system "make", "check"
	 system "make", "PREFIX=#{prefix}", "install"
