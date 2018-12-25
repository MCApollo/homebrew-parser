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
optional_deps :
conflicts :
resource :
	 ['sample']
	 ['https://github.com/foo86/dcadec-samples/raw/fa7dcf8c98c6d/xll_71_24_96_768.dtshd']
patches :
EOF_patch :
install :
	 system "make", "all"
	 system "make", "check"
	 system "make", "PREFIX=#{prefix}", "install"
