name :
	 Gdb
homepage :
	 https://www.gnu.org/software/gdb/
url :
	 https://ftp.gnu.org/gnu/gdb/gdb-8.2.tar.xz
description :
	 GNU debugger
build_deps :
	 pkg-config
link_deps :
optional_deps :
	 guile@2.0
	 python
	 python@2
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/d457e55/gdb/all-targets.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/d457e55/gdb/mojave.diff
EOF_patch :
install :
	 args = [
	 "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 ]
	 args << "--with-guile" if build.with? "guile@2.0"
	 args << "--enable-targets=all" if build.with? "all-targets"
	 if build.with?("python@2") && build.with?("python")
	 odie "Options --with-python and --with-python@2 are mutually exclusive."
	 elsif build.with?("python@2")
	 args << "--with-python=#{Formula["python@2"].opt_bin}/python2"
	 ENV.append "CPPFLAGS", "-I#{Formula["python@2"].opt_libexec}"
	 elsif build.with?("python")
	 args << "--with-python=#{Formula["python"].opt_bin}/python3"
	 ENV.append "CPPFLAGS", "-I#{Formula["python"].opt_libexec}"
	 else
	 args << "--with-python=/usr"
	 end
	 if build.with? "version-suffix"
	 args << "--program-suffix=-#{version.to_s.slice(/^\d/)}"
	 end
	 system "./configure", *args
	 system "make"
	 inreplace ["bfd/Makefile", "opcodes/Makefile"], /^install:/, "dontinstall:"
	 system "make", "install"
