name :
	 Xtail
homepage :
	 https://www.unicom.com/sw/xtail
url :
	 https://www.unicom.com/files/xtail-2.1.tar.gz
description :
	 Watch growth of multiple files or directories (like `tail -f`)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 man1.mkpath
	 bin.mkpath
	 system "make", "install"
