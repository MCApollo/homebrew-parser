name :
	 Mtools
homepage :
	 https://www.gnu.org/software/mtools/
url :
	 https://ftp.gnu.org/gnu/mtools/mtools-4.0.18.tar.gz
description :
	 Tools for manipulating MSDOS files
build_deps :
link_deps :
	 :x11
conflicts :
	 multimarkdown
patches :
EOF_patch :
install :
	 if ENV.cc == "clang"
	 inreplace "sysincludes.h",
	 "
	 "
