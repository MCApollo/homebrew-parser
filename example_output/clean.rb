name :
	 Clean
homepage :
	 https://clean.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/clean/clean/3.4/clean-3.4.tar.bz2
description :
	 Search for files matching a regex and delete them
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "clean"
	 man1.install "clean.1"
