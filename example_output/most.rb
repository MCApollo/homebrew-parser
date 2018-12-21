name :
	 Most
homepage :
	 https://www.jedsoft.org/most/
url :
	 https://www.jedsoft.org/releases/most/most-5.0.0a.tar.bz2
description :
	 Powerful paging program
build_deps :
link_deps :
	 s-lang
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-slang=#{HOMEBREW_PREFIX}"
	 system "make", "install"
