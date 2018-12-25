name :
	 Coreutils
homepage :
	 https://www.gnu.org/software/coreutils
url :
	 https://ftp.gnu.org/gnu/coreutils/coreutils-8.30.tar.xz
description :
	 GNU File, Shell, and Text utilities
build_deps :
link_deps :
optional_deps :
	 gmp
conflicts :
	 ganglia
	 gegl
	 idutils
	 aardvark_shell_utils
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if MacOS.version == :el_capitan
	 ENV["gl_cv_func_getcwd_abort_bug"] = "no"
	 inreplace "lib/renameat2.c", "defined RENAME_EXCL", "defined UNDEFINED_GIBBERISH"
	 end
	 system "./bootstrap" if build.head?
	 args = %W[
	 --prefix=#{prefix}
	 --program-prefix=g
	 ]
	 args << "--without-gmp" if build.without? "gmp"
	 system "./configure", *args
	 system "make", "install"
	 coreutils_filenames(bin).each do |cmd|
	 (libexec/"gnubin").install_symlink bin/"g#{cmd}" => cmd
	 end
	 coreutils_filenames(man1).each do |cmd|
	 (libexec/"gnuman"/"man1").install_symlink man1/"g#{cmd}" => cmd
	 end
	 bin.install_symlink "grealpath" => "realpath"
	 man1.install_symlink "grealpath.1" => "realpath.1"
