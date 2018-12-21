name :
	 Fprobe
homepage :
	 https://sourceforge.net/projects/fprobe/
url :
	 https://downloads.sourceforge.net/project/fprobe/fprobe/1.1/fprobe-1.1.tar.bz2
description :
	 Libpcap-based NetFlow probe
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--mandir=#{man}",
	 "--prefix=#{prefix}"
	 system "make", "install"
