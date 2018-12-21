name :
	 Sxiv
homepage :
	 https://github.com/muennich/sxiv
url :
	 https://github.com/muennich/sxiv/archive/v1.3.2.tar.gz
description :
	 Simple X Image Viewer
build_deps :
link_deps :
	 giflib
	 imlib2
	 libexif
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 system "make", "config.h"
	 system "make", "PREFIX=#{prefix}", "install"
