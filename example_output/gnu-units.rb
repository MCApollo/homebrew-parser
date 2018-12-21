name :
	 GnuUnits
homepage :
	 https://www.gnu.org/software/units/
url :
	 https://ftp.gnu.org/gnu/units/units-2.18.tar.gz
description :
	 GNU unit conversion tool
build_deps :
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 args = ["--prefix=#{prefix}", "--with-installed-readline"]
	 args << "--program-prefix=g" if build.without? "default-names"
	 system "./configure", *args
	 system "make", "install"
	 if build.without? "default-names"
	 (libexec/"gnubin").install_symlink bin/"gunits" => "units"
	 (libexec/"gnubin").install_symlink bin/"gunits_cur" => "units_cur"
	 (libexec/"gnuman/man1").install_symlink man1/"gunits.1" => "units.1"
