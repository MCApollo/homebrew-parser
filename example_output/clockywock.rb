name :
	 Clockywock
homepage :
	 https://soomka.com/
url :
	 https://soomka.com/clockywock-0.3.1a.tar.gz
description :
	 Ncurses analog clock
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "clockywock"
	 man7.install "clockywock.7"
