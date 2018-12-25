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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "Makefile" do |s|
	 s.change_make_var! "DESTDIR", prefix
	 s.change_make_var! "CC", ENV.cc
	 s.gsub! "-o 0 -g 0", ""
	 end
	 inreplace "mkhexgrid.cpp" do |s|
	 s.sub! "catch (exception &e)", "catch (std::exception &e)"
	 end
	 system "make"
	 system "make", "install"
