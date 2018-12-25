name :
	 Naga
homepage :
	 https://github.com/anayjoshi/naga/
url :
	 https://github.com/anayjoshi/naga/archive/naga-v1.0.tar.gz
description :
	 Terminal implementation of the Snake game
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
	 bin.mkpath
	 system "make", "install", "INSTALL_PATH=#{bin}/naga"
