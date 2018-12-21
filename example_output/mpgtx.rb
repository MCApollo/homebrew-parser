name :
	 Mpgtx
homepage :
	 https://mpgtx.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/mpgtx/mpgtx/1.3.1/mpgtx-1.3.1.tar.gz
description :
	 Toolbox to manipulate MPEG files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--parachute",
	 "--prefix=#{prefix}",
	 "--manprefix=#{man}"
	 system "make", "LFLAGS="
	 system "make", "install", "cpflags=RP"
