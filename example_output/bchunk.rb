name :
	 Bchunk
homepage :
	 http://he.fi/bchunk/
url :
	 http://he.fi/bchunk/bchunk-1.2.2.tar.gz
description :
	 Convert CD images from .bin/.cue to .iso/.cdr
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "bchunk"
	 man1.install "bchunk.1"
