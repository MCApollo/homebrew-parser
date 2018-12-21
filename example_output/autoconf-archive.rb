name :
	 AutoconfArchive
homepage :
	 https://savannah.gnu.org/projects/autoconf-archive/
url :
	 https://ftp.gnu.org/gnu/autoconf-archive/autoconf-archive-2018.03.13.tar.xz
description :
	 Collection of over 500 reusable autoconf macros
build_deps :
link_deps :
	 autoconf
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
