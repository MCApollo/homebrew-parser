name :
	 GnuTar
homepage :
	 https://www.gnu.org/software/tar/
url :
	 https://ftp.gnu.org/gnu/tar/tar-1.30.tar.gz
description :
	 GNU version of the tar archiving utility
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["gl_cv_func_getcwd_abort_bug"] = "no" if MacOS.version == :el_capitan
	 args = ["--prefix=#{prefix}", "--mandir=#{man}"]
	 args << "--program-prefix=g" if build.without? "default-names"
	 system "./bootstrap" if build.head?
	 system "./configure", *args
	 system "make", "install"
	 if build.without? "default-names"
	 (libexec/"gnubin").install_symlink bin/"gtar" =>"tar"
	 (libexec/"gnuman/man1").install_symlink man1/"gtar.1" => "tar.1"
	 end
