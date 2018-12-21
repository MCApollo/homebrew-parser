name :
	 Gnuski
homepage :
	 https://gnuski.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gnuski/gnuski/gnuski-0.3/gnuski-0.3.tar.gz
description :
	 Open source clone of Skifree
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "gnuski"
