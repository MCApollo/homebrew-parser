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
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
