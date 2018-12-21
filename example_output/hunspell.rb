name :
	 Hunspell
homepage :
	 https://hunspell.github.io
url :
	 https://github.com/hunspell/hunspell/archive/v1.7.0.tar.gz
description :
	 Spell checker and morphological analyzer
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 gettext
	 readline
conflicts :
	 freeling
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-ui",
	 "--with-readline"
	 system "make"
	 system "make", "check"
	 system "make", "install"
	 pkgshare.install "tests"
