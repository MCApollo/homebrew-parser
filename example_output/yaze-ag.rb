name :
	 YazeAg
homepage :
	 http://www.mathematik.uni-ulm.de/users/ag/yaze-ag/
url :
	 http://www.mathematik.uni-ulm.de/users/ag/yaze-ag/devel/yaze-ag-2.40.5_with_keytrans.tar.gz
description :
	 Yet Another Z80 Emulator (by AG)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile_solaris_gcc", "md5sum -b", "md5"
	 bin.mkpath
	 system "make", "-f", "Makefile_solaris_gcc",
	 "BINDIR=#{bin}",
	 "MANDIR=#{man1}",
	 "LIBDIR=#{lib}/yaze",
	 "install"
