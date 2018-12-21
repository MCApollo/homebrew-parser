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
	 (var/"nxengine").mkpath
	 ln_sf Dir[pkgshare/"*"], "#{var}/nxengine/"
	 ln_sf "/Library/Fonts/Courier New.ttf", "#{var}/nxengine/font.ttf"
