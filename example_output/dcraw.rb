name :
	 Dcraw
homepage :
	 https://www.cybercom.net/~dcoffin/dcraw/
url :
	 https://www.cybercom.net/~dcoffin/dcraw/archive/dcraw-9.28.0.tar.gz
description :
	 Digital camera RAW photo decoding software
build_deps :
link_deps :
	 jasper
	 jpeg
	 little-cms2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append_to_cflags "-I#{HOMEBREW_PREFIX}/include -L#{HOMEBREW_PREFIX}/lib"
	 system ENV.cc, "-o", "dcraw", ENV.cflags, "dcraw.c", "-lm", "-ljpeg", "-llcms2", "-ljasper"
	 bin.install "dcraw"
	 man1.install "dcraw.1"
