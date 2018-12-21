name :
	 RomTools
homepage :
	 https://mamedev.org/
url :
	 https://github.com/mamedev/mame/archive/mame0204.tar.gz
description :
	 Tools for Multiple Arcade Machine Emulator
build_deps :
	 pkg-config
link_deps :
	 flac
	 portmidi
	 sdl2
	 utf8proc
conflicts :
patches :
EOF_patch :
install :
	 inreplace "scripts/src/osd/sdl.lua", "--static", ""
	 system "make", "TOOLS=1",
	 "PTR64=
	 "USE_LIBSDL=1",
	 "USE_SYSTEM_LIB_EXPAT=1",
	 "USE_SYSTEM_LIB_ZLIB=1",
	 "USE_SYSTEM_LIB_FLAC=1",
	 "USE_SYSTEM_LIB_PORTMIDI=1",
	 "USE_SYSTEM_LIB_UTF8PROC=1"
	 bin.install %w[
	 aueffectutil castool chdman floptool imgtool jedutil ldresample
	 ldverify nltool nlwav pngcmp regrep romcmp src2html srcclean unidasm
	 ]
	 bin.install "split" => "rom-split"
	 man1.install Dir["docs/man/*.1"]
