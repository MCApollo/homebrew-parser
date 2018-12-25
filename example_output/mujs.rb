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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "release"
	 system "make", "prefix=#{prefix}", "install"
