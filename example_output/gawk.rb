name :
	 Gawk
homepage :
	 https://www.gnu.org/software/gawk/
url :
	 https://ftp.gnu.org/gnu/gawk/gawk-4.2.1.tar.xz
description :
	 GNU awk utility
build_deps :
link_deps :
	 gettext
	 mpfr
	 readline
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-libsigsegv-prefix"
	 system "make"
	 system "make", "check"
	 system "make", "install"
	 (libexec/"gnubin").install_symlink bin/"gawk" => "awk"
	 (libexec/"gnuman/man1").install_symlink man1/"gawk.1" => "awk.1"
