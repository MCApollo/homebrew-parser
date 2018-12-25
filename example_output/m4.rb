name :
	 M4
homepage :
	 https://www.gnu.org/software/m4
url :
	 https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz
description :
	 Macro processing language
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/macports/macports-ports/edf0ee1e2cf/devel/m4/files/secure_snprintf.patch
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
