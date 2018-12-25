name :
	 Delta
homepage :
	 http://delta.tigris.org/
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/d/delta/delta_2006.08.03.orig.tar.gz
description :
	 Programatically minimize files to isolate features of interest
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
	 system "make"
	 bin.install "delta", "multidelta", "topformflat"
