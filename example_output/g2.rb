name :
	 G2
homepage :
	 https://orefalo.github.io/g2/
url :
	 https://github.com/orefalo/g2/archive/v1.1.tar.gz
description :
	 Friendly git client
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
	 system "make", "prefix=#{prefix}", "install"
