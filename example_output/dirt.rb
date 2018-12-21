name :
	 Dirt
homepage :
	 https://github.com/tidalcycles/Dirt
url :
	 https://github.com/tidalcycles/Dirt/archive/1.1.tar.gz
description :
	 Experimental sample playback
build_deps :
link_deps :
	 jack
	 liblo
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "install"
