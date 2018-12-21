name :
	 Tcping
homepage :
	 https://web.archive.org/web/20171102193822/linuxco.de/tcping/tcping.html
url :
	 https://mirrors.kernel.org/gentoo/distfiles/tcping-1.3.5.tar.gz
description :
	 TCP connect to the given IP/port combo
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "tcping"
