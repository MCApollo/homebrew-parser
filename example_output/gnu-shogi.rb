name :
	 GnuShogi
homepage :
	 https://www.gnu.org/software/gnushogi/
url :
	 https://ftp.gnu.org/gnu/gnushogi/gnushogi-1.4.2.tar.gz
description :
	 GNU Shogi (Japanese Chess)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install", "MANDIR=#{man6}", "INFODIR=#{info}"
