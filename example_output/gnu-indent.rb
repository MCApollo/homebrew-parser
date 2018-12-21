name :
	 GnuIndent
homepage :
	 https://www.gnu.org/software/indent/
url :
	 https://ftp.gnu.org/gnu/indent/indent-2.2.12.tar.gz
description :
	 C code prettifier
build_deps :
link_deps :
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --mandir=#{man}
	 ]
	 args << "--program-prefix=g" if build.without? "default-names"
	 system "./configure", *args
	 system "make", "install"
	 if build.without? "default-names"
	 (libexec/"gnubin").install_symlink bin/"gindent" => "indent"
	 (libexec/"gnuman/man1").install_symlink man1/"gindent.1" => "indent.1"
