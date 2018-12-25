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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "defs.h", "#define OMEGALIB \"./omegalib/\"", "#define OMEGALIB \"#{libexec}/\""
	 inreplace "Makefile" do |s|
	 s.remove_make_var! ["CC", "CFLAGS", "LDFLAGS"]
	 end
	 ENV.append_to_cflags "-DUNIX -DSYSV"
	 system "make"
	 bin.install "omega"
	 libexec.install Dir["omegalib/*"]
	 ln_s prefix/"license.txt", libexec/"license.txt"
