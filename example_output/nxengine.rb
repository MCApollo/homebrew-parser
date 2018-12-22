name :
	 Nxengine
homepage :
	 https://nxengine.sourceforge.io/
url :
	 https://nxengine.sourceforge.io/dl/nx-src-1006.tar.bz2
description :
	 Rewrite of Cave Story (Doukutsu Monogatari)
build_deps :
link_deps :
	 sdl
	 sdl_ttf
conflicts :
patches :
EOF_patch :
install :
	 inreplace "platform/Linux/vbesync.c", "#include <libdrm\/drm\.h>", ""
	 inreplace ["sound/org.cpp", "sound/pxt.cpp"] do |s|
	 s.gsub! "endian.h", "libkern/OSByteOrder.h"
	 s.gsub! "htole16", "OSSwapHostToLittleInt16"
	 end
	 inreplace "graphics/font.cpp",
	 /(fontfile) = "(\w+\.(bmp|ttf))"/,
	 "\\1 = \"#{var}/nxengine/\\2\""
	 inreplace "platform.cpp",
	 /(return .*fopen)\((fname), mode\);/,
	 "char fn[256]; strcpy(fn, \"#{var}/nxengine/\"); strcat(fn, \\2); \\1(fn, mode);"
	 inreplace "graphics/nxsurface.cpp",
	 /(image = SDL_LoadBMP)\((pbm_name)\);/,
	 "char fn[256]; strcpy(fn, \"#{var}/nxengine/\"); strcat(fn, \\2); \\1(fn);"
	 inreplace "extract/extractpxt.cpp",
	 /(mkdir)\((\".+\")/,
	 "char dir[256]; strcpy(dir, \"#{var}/nxengine/\"); strcat(dir, \\2); \\1(dir"
	 inreplace "extract/extractfiles.cpp" do |s|
	 s.gsub! /char \*dir = strdup\((fname)\);/,
	 "char *dir = (char *)malloc(256); strcpy(dir, \"#{var}/nxengine/\"); strcat(dir, \\1);"
	 s.gsub! "strchr", "strrchr"
	 end
	 system "make"
	 bin.install "nx"
	 pkgshare.install ["smalfont.bmp", "sprites.sif", "tilekey.dat"]
	 resource("game").stage do
	 pkgshare.install ["Doukutsu.exe", "data"]
	 end
	 (var/"nxengine").mkpath
	 ln_sf Dir[pkgshare/"*"], "#{var}/nxengine/"
	 ln_sf "/Library/Fonts/Courier New.ttf", "#{var}/nxengine/font.ttf"
