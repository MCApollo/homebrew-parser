name :
	 Fontconfig
homepage :
	 https://wiki.freedesktop.org/www/Software/fontconfig/
url :
	 https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.13.1.tar.bz2
description :
	 XML-based font configuration API for X Windows
build_deps :
	 pkg-config
link_deps :
	 freetype
conflicts :
patches :
EOF_patch :
install :
	 font_dirs = %w[
	 /System/Library/Fonts
	 /Library/Fonts
	 ~/Library/Fonts
	 ]
	 if MacOS.version >= :sierra
	 font_dirs << Dir["/System/Library/Assets/com_apple_MobileAsset_Font*"].max
	 ohai "Regenerating font cache, this may take a while"
	 system "#{bin}/fc-cache", "-frv"
