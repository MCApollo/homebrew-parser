name :
	 Make
homepage :
	 https://www.gnu.org/software/make/
url :
	 https://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2
description :
	 Utility for directing compilation
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 args << "--program-prefix=g" if build.without? "default-names"
	 system "./configure", *args
	 system "make", "install"
	 if build.without? "default-names"
	 (libexec/"gnubin").install_symlink bin/"gmake" =>"make"
	 (libexec/"gnuman/man1").install_symlink man1/"gmake.1" => "make.1"
	 end
