name :
	 Sfst
homepage :
	 http://www.cis.uni-muenchen.de/~schmid/tools/SFST/
url :
	 http://www.cis.uni-muenchen.de/~schmid/tools/SFST/data/SFST-1.4.7d.tar.gz
description :
	 Toolbox for morphological analysers and other FST-based tools
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "src" do
	 system "make"
	 system "make", "DESTDIR=#{prefix}/", "install"
	 system "make", "DESTDIR=#{share}/", "maninstall"
