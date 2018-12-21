name :
	 Xrick
homepage :
	 https://www.bigorno.net/xrick/
url :
	 https://www.bigorno.net/xrick/xrick-021212.tgz
description :
	 Clone of Rick Dangerous
build_deps :
link_deps :
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/xrick.c", "data.zip", "#{pkgshare}/data.zip"
	 system "make"
	 bin.install "xrick"
	 man6.install "xrick.6.gz"
	 pkgshare.install "data.zip"
