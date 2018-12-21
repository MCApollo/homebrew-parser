name :
	 GnuGo
homepage :
	 https://www.gnu.org/software/gnugo/gnugo.html
url :
	 https://ftp.gnu.org/gnu/gnugo/gnugo-3.8.tar.gz
description :
	 GNU Go
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-readline"
	 system "make", "install"
