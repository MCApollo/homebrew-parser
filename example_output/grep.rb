name :
	 Grep
homepage :
	 https://www.gnu.org/software/grep/
url :
	 https://ftp.gnu.org/gnu/grep/grep-3.1.tar.xz
description :
	 GNU grep, egrep and fgrep
build_deps :
	 pkg-config
link_deps :
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-nls
	 --prefix=#{prefix}
	 --infodir=#{info}
	 --mandir=#{man}
	 --with-packager=Homebrew
	 ]
	 args << "--program-prefix=g" if build.without? "default-names"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 if build.without? "default-names"
	 (libexec/"gnubin").install_symlink bin/"ggrep" => "grep"
	 (libexec/"gnubin").install_symlink bin/"gegrep" => "egrep"
	 (libexec/"gnubin").install_symlink bin/"gfgrep" => "fgrep"
	 (libexec/"gnuman/man1").install_symlink man1/"ggrep.1" => "grep.1"
	 (libexec/"gnuman/man1").install_symlink man1/"gegrep.1" => "egrep.1"
	 (libexec/"gnuman/man1").install_symlink man1/"gfgrep.1" => "fgrep.1"
