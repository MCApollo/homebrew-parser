name :
	 Rgbds
homepage :
	 https://github.com/rednex/rgbds
url :
	 https://github.com/rednex/rgbds/archive/v0.3.7.tar.gz
description :
	 Rednex GameBoy Development System
build_deps :
	 pkg-config
link_deps :
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}", "mandir=#{man}"
