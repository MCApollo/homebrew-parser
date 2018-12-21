name :
	 Glulxe
homepage :
	 https://www.eblong.com/zarf/glulx/
url :
	 https://eblong.com/zarf/glulx/glulxe-054.tar.gz
description :
	 Portable VM like the Z-machine
build_deps :
	 glktermw
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 glk = Formula["glktermw"]
	 inreplace "Makefile", "GLKINCLUDEDIR = ../cheapglk", "GLKINCLUDEDIR = #{glk.include}"
	 inreplace "Makefile", "GLKLIBDIR = ../cheapglk", "GLKLIBDIR = #{glk.lib}"
	 inreplace "Makefile", "Make.cheapglk", "Make.#{glk.name}"
	 system "make"
	 bin.install "glulxe"
