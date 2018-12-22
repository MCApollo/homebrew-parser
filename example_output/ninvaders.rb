name :
	 Ninvaders
homepage :
	 https://ninvaders.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ninvaders/ninvaders/0.1.1/ninvaders-0.1.1.tar.gz
description :
	 Space Invaders in the terminal
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 inreplace "Makefile" do |s|
	 s.change_make_var! "CC", ENV.cc
	 s.gsub! "-o$@", "-o $@"
	 end
	 system "make"
	 bin.install "nInvaders"
