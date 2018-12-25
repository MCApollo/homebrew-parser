name :
	 Ncurses
homepage :
	 https://www.gnu.org/software/ncurses/
url :
	 https://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz
description :
	 Text-based UI library
build_deps :
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-pc-files",
	 "--with-pkg-config-libdir=#{lib}/pkgconfig",
	 "--enable-sigwinch",
	 "--enable-symlinks",
	 "--enable-widec",
	 "--with-shared",
	 "--with-gpm=no"
	 system "make", "install"
	 make_libncurses_symlinks
	 prefix.install "test"
	 (prefix/"test").install "install-sh", "config.sub", "config.guess"
