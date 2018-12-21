name :
	 Termbox
homepage :
	 https://code.google.com/p/termbox/
url :
	 https://github.com/nsf/termbox/archive/v1.1.2.tar.gz
description :
	 Library for writing text-based user interfaces
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf"
	 system "./waf", "install"
