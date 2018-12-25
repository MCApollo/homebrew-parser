name :
	 Glktermw
homepage :
	 https://www.eblong.com/zarf/glk/
url :
	 https://www.eblong.com/zarf/glk/glktermw-104.tar.gz
description :
	 Terminal-window Glk library with Unicode support
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
	 inreplace "gtoption.h", "/* #define LOCAL_NCURSESW */", "#define LOCAL_NCURSESW"
	 inreplace "Makefile", "-lncursesw", "-lncurses"
	 system "make"
	 lib.install "libglktermw.a"
	 include.install "glk.h", "glkstart.h", "gi_blorb.h", "gi_dispa.h", "Make.glktermw"
