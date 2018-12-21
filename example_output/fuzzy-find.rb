name :
	 FuzzyFind
homepage :
	 https://github.com/silentbicycle/ff
url :
	 https://github.com/silentbicycle/ff/archive/v0.6-flag-features.tar.gz
description :
	 Fuzzy filename finder matching across directories as well as files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "ff"
	 man1.install "ff.1"
	 elisp.install "fuzzy-find.el"
