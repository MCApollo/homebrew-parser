name :
	 Libvterm
homepage :
	 http://www.leonerd.org.uk/code/libvterm/
url :
	 http://www.leonerd.org.uk/code/libvterm/libvterm-0+bzr681.tar.gz
description :
	 C99 library which implements a VT220 or xterm terminal emulator
build_deps :
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
