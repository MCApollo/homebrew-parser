name :
	 Slashem
homepage :
	 https://slashem.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/slashem/slashem-source/0.0.8E0F1/se008e0f1.tar.gz
description :
	 Fork/variant of Nethack
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
	 https://gist.githubusercontent.com/mistydemeo/76dd291c77a509216418/raw/65a41804b7d7e1ae6ab6030bde88f7d969c955c3/slashem-configure.patch
EOF_patch :
	 diff --git a/win/tty/termcap.c b/win/tty/termcap.c
	 index c3bdf26..8d00b11 100644
	 --- a/win/tty/termcap.c
	 +++ b/win/tty/termcap.c
	 @@ -960,7 +960,7 @@ cl_eos()			/* free after Robert Viduya */
	 #include <curses.h>
	 -#if !defined(LINUX) && !defined(__FreeBSD__)
	 +#if !defined(LINUX) && !defined(__FreeBSD__) && !defined(__APPLE__)
	 extern char *tparm();
	 #endif
install :
	 ENV.deparallelize
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-mandir=#{man}",
	 "--with-group=#{Etc.getpwuid.gid}",
	 "--with-owner=#{Etc.getpwuid.name}",
	 "--enable-wizmode=#{Etc.getpwuid.name}"
	 system "make", "install"
	 man6.install "doc/slashem.6", "doc/recover.6"
