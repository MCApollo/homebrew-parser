name :
	 Shmcat
homepage :
	 https://shmcat.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/shmcat/shmcat-1.9.tar.xz
description :
	 Tool that dumps shared memory segments (System V and POSIX)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-ftok",
	 "--disable-nls"
	 system "make", "install"
