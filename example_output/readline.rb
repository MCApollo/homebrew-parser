name :
	 Readline
homepage :
	 https://tiswww.case.edu/php/chet/readline/rltop.html
url :
	 https://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz
description :
	 Library for command-line editing
build_deps :
link_deps :
conflicts :
patches :
	 https://ftp.gnu.org/gnu/readline/readline-7.0-patches/readline70-#{p}
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
