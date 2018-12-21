name :
	 Ttyrec
homepage :
	 http://0xcc.net/ttyrec/
url :
	 http://0xcc.net/ttyrec/ttyrec-1.0.8.tar.gz
description :
	 Terminal interaction recorder and player
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "ttyrec.c", "<libutil.h>", "<util.h>"
	 system "make", "CFLAGS=#{ENV.cflags} -DHAVE_openpty"
	 bin.install %w[ttytime ttyplay ttyrec]
	 man1.install Dir["*.1"]
