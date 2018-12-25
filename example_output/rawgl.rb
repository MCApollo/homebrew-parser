name :
	 Rawgl
homepage :
	 https://github.com/cyxx/rawgl
url :
	 https://github.com/cyxx/rawgl/archive/rawgl-0.2.1.tar.gz
description :
	 Rewritten engine for Another World
build_deps :
link_deps :
	 sdl2
	 sdl2_mixer
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "rawgl"
