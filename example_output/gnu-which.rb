name :
	 GnuWhich
homepage :
	 https://savannah.gnu.org/projects/which/
url :
	 https://ftp.gnu.org/gnu/which/which-2.21.tar.gz
description :
	 GNU implementation of which utility
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
	 args = ["--prefix=#{prefix}", "--disable-dependency-tracking"]
	 args << "--program-prefix=g" if build.without? "default-names"
	 system "./configure", *args
	 system "make", "install"
	 if build.without? "default-names"
	 (libexec/"gnubin").install_symlink bin/"gwhich" => "which"
	 (libexec/"gnuman/man1").install_symlink man1/"gwhich.1" => "which.1"
	 end
