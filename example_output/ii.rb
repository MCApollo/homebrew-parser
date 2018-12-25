name :
	 Ii
homepage :
	 https://tools.suckless.org/ii/
url :
	 https://dl.suckless.org/tools/ii-1.8.tar.gz
description :
	 Minimalist IRC client
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
	 inreplace "Makefile", "SRC = ii.c strlcpy.c", "SRC = ii.c"
	 system "make", "install", "PREFIX=#{prefix}"
