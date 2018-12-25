name :
	 Enchant
homepage :
	 https://abiword.github.io/enchant/
url :
	 https://github.com/AbiWord/enchant/releases/download/v2.2.3/enchant-2.2.3.tar.gz
description :
	 Spellchecker wrapping library
build_deps :
	 pkg-config
link_deps :
	 aspell
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-relocatable"
	 system "make", "install"
	 ln_s "enchant-2.pc", lib/"pkgconfig/enchant.pc"
