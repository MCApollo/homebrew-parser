name :
	 M2c
homepage :
	 https://savannah.nongnu.org/projects/m2c/
url :
	 https://download.savannah.gnu.org/releases/m2c/0.7/m2c-0.7.tar.gz
description :
	 Modula-2 to C compiler
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
	 cp "config/generic-gcc.h", "config/generic-clang.h"
	 system "./configure", "+cc=#{ENV.cc}"
	 inreplace "Makefile", "install: all uninstall", "install: all"
	 inreplace "Makefile", "mkdir", "mkdir -p"
	 include.mkpath
	 system "make", "install", "prefix=#{prefix}", "man1dir=#{man1}"
