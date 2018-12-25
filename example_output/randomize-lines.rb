name :
	 RandomizeLines
homepage :
	 https://arthurdejong.org/rl/
url :
	 https://arthurdejong.org/rl/rl-0.2.7.tar.gz
description :
	 Reads and randomize lines from a file (or STDIN)
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
