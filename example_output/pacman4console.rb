name :
	 Pacman4console
homepage :
	 https://sites.google.com/site/doctormike/pacman.html
url :
	 https://sites.google.com/site/doctormike/pacman-1.3.tar.gz
description :
	 Pacman for console
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "prefix=#{prefix}", "datarootdir=#{pkgshare}"
	 bin.install ["pacman", "pacmanedit"]
	 (pkgshare+"pacman").install "Levels"
