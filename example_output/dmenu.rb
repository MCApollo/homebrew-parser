name :
	 Dmenu
homepage :
	 https://tools.suckless.org/dmenu/
url :
	 https://dl.suckless.org/tools/dmenu-4.8.tar.gz
description :
	 Dynamic menu for X11
build_deps :
link_deps :
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "install"
