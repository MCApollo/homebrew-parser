name :
	 Wdiff
homepage :
	 https://www.gnu.org/software/wdiff/
url :
	 https://ftp.gnu.org/gnu/wdiff/wdiff-1.2.2.tar.gz
description :
	 Display word differences between text files
build_deps :
link_deps :
	 gettext
optional_deps :
conflicts :
	 montage
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-experimental"
	 system "make", "install"
