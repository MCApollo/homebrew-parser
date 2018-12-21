name :
	 Neofetch
homepage :
	 https://github.com/dylanaraps/neofetch
url :
	 https://github.com/dylanaraps/neofetch/archive/5.0.0.tar.gz
description :
	 Fast, highly customisable system info script
build_deps :
link_deps :
	 imagemagick
	 screenresolution
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
