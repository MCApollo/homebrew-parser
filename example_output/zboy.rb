name :
	 Zboy
homepage :
	 https://zboy.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/zboy/zBoy%20v0.60/zboy-0.60.tar.gz
description :
	 GameBoy emulator
build_deps :
link_deps :
	 sdl2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 sdl2 = Formula["sdl2"]
	 ENV.append_to_cflags "-std=gnu89 -D__zboy4linux__ -DNETPLAY -DLFNAVAIL -I#{sdl2.include} -L#{sdl2.lib}"
	 system "make", "-f", "Makefile.linux", "CFLAGS=#{ENV.cflags}"
	 bin.install "zboy"
