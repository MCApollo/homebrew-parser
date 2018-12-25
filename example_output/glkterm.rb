name :
	 Glkterm
homepage :
	 https://www.eblong.com/zarf/glk/
url :
	 https://www.eblong.com/zarf/glk/glkterm-104.tar.gz
description :
	 Terminal-window Glk library
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
	 lib.install "libglkterm.a"
	 include.install "glk.h", "glkstart.h", "gi_blorb.h", "gi_dispa.h", "Make.glkterm"
