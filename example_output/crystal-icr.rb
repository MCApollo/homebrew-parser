name :
	 CrystalIcr
homepage :
	 https://github.com/crystal-community/icr
url :
	 https://github.com/crystal-community/icr/archive/v0.6.0.tar.gz
description :
	 Interactive console for Crystal programming language
build_deps :
link_deps :
	 crystal
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
