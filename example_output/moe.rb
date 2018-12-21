name :
	 Moe
homepage :
	 https://www.gnu.org/software/moe/moe.html
url :
	 https://ftp.gnu.org/gnu/moe/moe-1.9.tar.lz
description :
	 Console text editor for ISO-8859 and ASCII
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "window_vector.cc", "{ year_string.insert( 0U, 1,",
	 "{ year_string.insert( 0U, 1U,"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
