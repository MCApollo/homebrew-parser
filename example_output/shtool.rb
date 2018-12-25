name :
	 Shtool
homepage :
	 https://www.gnu.org/software/shtool/
url :
	 https://ftp.gnu.org/gnu/shtool/shtool-2.0.8.tar.gz
description :
	 GNU's portable shell tool
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
	 system "make", "install"
