name :
	 Mujs
homepage :
	 https://www.mujs.com/
url :
	 https://github.com/ccxvii/mujs.git
description :
	 Embeddable Javascript interpreter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "release"
	 system "make", "prefix=#{prefix}", "install"
