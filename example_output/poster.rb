name :
	 Poster
homepage :
	 https://schrfr.github.io/poster/
url :
	 https://github.com/schrfr/poster/archive/1.0.0.tar.gz
description :
	 Create large posters out of PostScript pages
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "poster"
	 man1.install "poster.1"
