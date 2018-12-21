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
	 gmp
conflicts :
	 ganglia
	 gegl
	 idutils
	 aardvark_shell_utils
patches :
EOF_patch :
install :
	 if MacOS.version == :el_capitan
	 ENV["gl_cv_func_getcwd_abort_bug"] = "no"
	 inreplace "lib/renameat2.c", "defined RENAME_EXCL", "defined UNDEFINED_GIBBERISH"
