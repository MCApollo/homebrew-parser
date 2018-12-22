name :
	 Dwarf
homepage :
	 https://github.com/elboza/dwarf-ng/
url :
	 https://github.com/elboza/dwarf-ng/archive/dwarf-0.4.0.tar.gz
description :
	 Object file manipulation tool
build_deps :
link_deps :
	 flex
	 readline
conflicts :
patches :
EOF_patch :
install :
	 %w[src/libdwarf.c doc/dwarf.man doc/xdwarf.man.html].each do |f|
	 inreplace f, "/etc/dwarfrc", etc/"dwarfrc"
	 end
	 system "make"
	 system "make", "install", "BINDIR=#{bin}", "MANDIR=#{man1}"
