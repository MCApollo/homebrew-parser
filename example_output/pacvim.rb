name :
	 Pacvim
homepage :
	 https://github.com/jmoon018/PacVim
url :
	 https://github.com/jmoon018/PacVim/archive/v1.1.1.tar.gz
description :
	 Learn vim commands via a game
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "make", "install", "PREFIX=#{prefix}"
