name :
	 GnuSed
homepage :
	 https://www.gnu.org/software/sed/
url :
	 https://ftp.gnu.org/gnu/sed/sed-4.5.tar.xz
description :
	 GNU implementation of the famous stream editor
build_deps :
link_deps :
conflicts :
	 ssed
patches :
EOF_patch :
install :
	 args = ["--prefix=#{prefix}", "--disable-dependency-tracking"]
	 args << "--program-prefix=g" if build.without? "default-names"
	 system "./configure", *args
	 system "make", "install"
	 if build.without? "default-names"
	 (libexec/"gnubin").install_symlink bin/"gsed" =>"sed"
	 (libexec/"gnuman/man1").install_symlink man1/"gsed.1" => "sed.1"
