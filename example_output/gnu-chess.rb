name :
	 GnuChess
homepage :
	 https://www.gnu.org/software/chess/
url :
	 https://ftp.gnu.org/gnu/chess/gnuchess-6.2.5.tar.gz
description :
	 GNU Chess
build_deps :
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "autoreconf", "--install"
	 chmod 0755, "install-sh"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 resource("book").stage do
	 doc.install "book_1.02.pgn"
	 end
