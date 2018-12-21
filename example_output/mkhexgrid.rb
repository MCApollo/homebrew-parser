name :
	 Mkhexgrid
homepage :
	 http://www.nomic.net/~uckelman/mkhexgrid/
url :
	 http://www.nomic.net/~uckelman/mkhexgrid/releases/mkhexgrid-0.1.1.src.tar.bz2
description :
	 Fully-configurable hex grid generator
build_deps :
link_deps :
	 boost
	 gd
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile" do |s|
	 s.change_make_var! "DESTDIR", prefix
	 s.change_make_var! "CC", ENV.cc
	 s.gsub! "-o 0 -g 0", ""
