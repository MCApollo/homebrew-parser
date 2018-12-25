name :
	 Fizmo
homepage :
	 https://fizmo.spellbreaker.org
url :
	 https://fizmo.spellbreaker.org/source/fizmo-0.8.5.tar.gz
description :
	 Z-Machine interpreter
build_deps :
	 pkg-config
link_deps :
	 freetype
	 jpeg
	 libpng
	 libsndfile
	 sdl2
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules"
	 system "make", "install"
