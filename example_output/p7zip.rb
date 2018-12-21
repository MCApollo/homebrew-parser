name :
	 P7zip
homepage :
	 https://p7zip.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/p7zip/p7zip/16.02/p7zip_16.02_src_all.tar.bz2
description :
	 7-Zip (high compression file archiver) implementation
build_deps :
link_deps :
conflicts :
patches :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/p/p7zip/p7zip_16.02+dfsg-6.debian.tar.xz
EOF_patch :
install :
	 mv "makefile.macosx_llvm_64bits", "makefile.machine"
	 system "make", "all3",
	 "CC=#{ENV.cc} $(ALLFLAGS)",
	 "CXX=#{ENV.cxx} $(ALLFLAGS)"
	 system "make", "DEST_HOME=#{prefix}",
	 "DEST_MAN=#{man}",
	 "install"
