name :
	 Texinfo
homepage :
	 https://www.gnu.org/software/texinfo/
url :
	 https://ftp.gnu.org/gnu/texinfo/texinfo-6.5.tar.xz
description :
	 Official documentation format of the GNU project
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
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-install-warnings",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 doc.install Dir["doc/refcard/txirefcard*"]
