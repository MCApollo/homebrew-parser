name :
	 Cppi
homepage :
	 https://www.gnu.org/software/cppi/
url :
	 https://ftp.gnu.org/gnu/cppi/cppi-1.18.tar.xz
description :
	 Indent C preprocessor directives to reflect their nesting
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
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
