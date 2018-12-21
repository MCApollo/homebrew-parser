name :
	 Xboard
homepage :
	 https://www.gnu.org/software/xboard/
url :
	 https://ftp.gnu.org/gnu/xboard/xboard-4.9.1.tar.gz
description :
	 Graphical user interface for chess
build_deps :
	 pkg-config
link_deps :
	 cairo
	 fairymax
	 gettext
	 gtk+
	 librsvg
	 polyglot
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 args = ["--prefix=#{prefix}",
	 "--with-gtk",
	 "--without-Xaw",
	 "--disable-zippy"]
	 system "./configure", *args
	 system "make"
	 system "make", "install"
