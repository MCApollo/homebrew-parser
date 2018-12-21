name :
	 Aalib
homepage :
	 https://aa-project.sourceforge.io/aalib/
url :
	 https://downloads.sourceforge.net/aa-project/aalib-1.4rc5.tar.gz
description :
	 Portable ASCII art graphics library
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/6e23dfb/aalib/1.4rc5.patch
EOF_patch :
install :
	 ENV.ncurses_define
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--infodir=#{info}",
	 "--enable-shared=yes",
	 "--enable-static=yes",
	 "--without-x"
	 system "make", "install"
