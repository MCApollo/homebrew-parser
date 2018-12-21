name :
	 Lwtools
homepage :
	 http://lwtools.projects.l-w.ca/
url :
	 http://lwtools.projects.l-w.ca/releases/lwtools/lwtools-4.15.tar.gz
description :
	 Cross-development tools for Motorola 6809 and Hitachi 6309
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "INSTALLDIR=#{bin}"
