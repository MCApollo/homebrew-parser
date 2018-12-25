name :
	 Puzzles
homepage :
	 https://www.chiark.greenend.org.uk/~sgtatham/puzzles/
url :
	 https://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-20180924.d8d5064.tar.gz
description :
	 Collection of one-player puzzle games
build_deps :
link_deps :
	 halibut
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "mkfiles.pl", /@osxarchs = .*/, "@osxarchs = ('x86_64');"
	 system "perl", "mkfiles.pl"
	 system "make", "-d", "-f", "Makefile.osx", "all"
	 prefix.install "Puzzles.app"
