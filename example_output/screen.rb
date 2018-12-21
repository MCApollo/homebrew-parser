name :
	 Screen
homepage :
	 https://www.gnu.org/software/screen
url :
	 https://ftp.gnu.org/gnu/screen/screen-4.6.2.tar.gz
description :
	 Terminal multiplexer with VT100/ANSI terminal emulation
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
	 https://gist.githubusercontent.com/yujinakayama/4608863/raw/75669072f227b82777df25f99ffd9657bd113847/gistfile1.diff
EOF_patch :
install :
	 cd "src" if build.head?
	 ENV.deparallelize
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--infodir=#{info}",
	 "--enable-colors256",
	 "--enable-pam"
	 system "make"
	 system "make", "install"
