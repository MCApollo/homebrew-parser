name :
	 Lsdvd
homepage :
	 https://sourceforge.net/projects/lsdvd
url :
	 https://downloads.sourceforge.net/project/lsdvd/lsdvd/lsdvd-0.17.tar.gz
description :
	 Read the content info of a DVD
build_deps :
	 pkg-config
link_deps :
	 libdvdread
	 libdvdcss
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
