name :
	 Cheapglk
homepage :
	 https://www.eblong.com/zarf/glk/
url :
	 https://www.eblong.com/zarf/glk/cheapglk-106.tar.gz
description :
	 Extremely minimal Glk library
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
	 system "make"
	 lib.install "libcheapglk.a"
	 include.install "glk.h", "glkstart.h", "gi_blorb.h", "gi_dispa.h", "Make.cheapglk"
