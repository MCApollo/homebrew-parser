name :
	 Dwarfutils
homepage :
	 https://www.prevanders.net/dwarf.html
url :
	 https://www.prevanders.net/libdwarf-20180809.tar.gz
description :
	 Dump and produce DWARF debug information in ELF objects
build_deps :
	 libelf
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure"
	 system "make"
	 bin.install "dwarfdump/dwarfdump"
	 man1.install "dwarfdump/dwarfdump.1"
	 lib.install "libdwarf/.libs/libdwarf.a"
	 include.install "libdwarf/dwarf.h"
	 include.install "libdwarf/libdwarf.h"
