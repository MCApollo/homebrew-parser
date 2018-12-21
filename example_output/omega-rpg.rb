name :
	 OmegaRpg
homepage :
	 http://www.alcyone.com/max/projects/omega/
url :
	 http://www.alcyone.com/binaries/omega/omega-0.80.2-src.tar.gz
description :
	 The classic Roguelike game
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "defs.h", "#define OMEGALIB \"./omegalib/\"", "#define OMEGALIB \"#{libexec}/\""
	 inreplace "Makefile" do |s|
	 s.remove_make_var! ["CC", "CFLAGS", "LDFLAGS"]
	 ln_s prefix/"license.txt", libexec/"license.txt"
