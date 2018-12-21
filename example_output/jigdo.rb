name :
	 Jigdo
homepage :
	 http://atterer.org/jigdo/
url :
	 http://atterer.org/sites/atterer/files/2009-08/jigdo/jigdo-0.7.3.tar.bz2
description :
	 Tool to distribute very large files over the internet
build_deps :
	 pkg-config
link_deps :
	 berkeley-db
	 wget
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e101570/jigdo/patch-src-compat.hh.diff
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-x11",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 system "make", "install"
