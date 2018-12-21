name :
	 Screenfetch
homepage :
	 https://github.com/KittyKatt/screenFetch
url :
	 https://github.com/KittyKatt/screenFetch/archive/v3.8.0.tar.gz
description :
	 Generate ASCII art with terminal, shell, and OS info
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "screenfetch-dev" => "screenfetch"
	 man1.install "screenfetch.1"
