name :
	 Curseofwar
homepage :
	 https://a-nikolaev.github.io/curseofwar/
url :
	 https://github.com/a-nikolaev/curseofwar/archive/v1.2.0.tar.gz
description :
	 Fast-paced action strategy game
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "curseofwar"
	 man6.install "curseofwar.6"
