name :
	 Libelf
homepage :
	 http://www.mr511.de/software/
url :
	 http://www.mr511.de/software/libelf-0.8.13.tar.gz
description :
	 ELF object file access library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-compat"
	 system "make"
	 system "make", "install"
