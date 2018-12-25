name :
	 Wumpus
homepage :
	 http://www.catb.org/~esr/wumpus/
url :
	 http://www.catb.org/~esr/wumpus/wumpus-1.6.tar.gz
description :
	 Exact clone of the ancient BASIC Hunt the Wumpus game
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://gitlab.com/esr/wumpus/commit/ea272d4786a55dbaa493d016324b7a05b4f165b9.diff
	 https://gitlab.com/esr/wumpus/commit/99022db86e54c3338d6a670f219a0845fd531530.diff
EOF_patch :
install :
	 system "make"
	 system "make", "prefix=#{prefix}", "install"
