name :
	 Yetris
homepage :
	 https://github.com/alexdantas/yetris
url :
	 https://github.com/alexdantas/yetris/archive/v2.3.0.tar.gz
description :
	 Customizable Tetris for the terminal
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
