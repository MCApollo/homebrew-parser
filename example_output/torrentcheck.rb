name :
	 Torrentcheck
homepage :
	 https://torrentcheck.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/torrentcheck/torrentcheck-1.00.zip
description :
	 Command-line torrent viewer and hash checker
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "torrentcheck.c", "#include <malloc.h>", ""
	 system ENV.cc, "torrentcheck.c", "sha1.c", "-o", "torrentcheck", *ENV.cflags.to_s.split
	 bin.install "torrentcheck"
