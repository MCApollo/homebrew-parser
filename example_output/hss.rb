name :
	 Hss
homepage :
	 https://github.com/six-ddc/hss
url :
	 https://github.com/six-ddc/hss/archive/1.7.tar.gz
description :
	 Interactive parallel SSH client
build_deps :
link_deps :
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "INSTALL_BIN=#{bin}"
