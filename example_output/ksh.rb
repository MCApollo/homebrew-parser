name :
	 Ksh
homepage :
	 http://www.kornshell.com
url :
	 https://opensource.apple.com/source/ksh/ksh-23/ast-ksh.2012-08-01.tgz
description :
	 KornShell, ksh93
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 resource("init").stage buildpath
	 (buildpath/"lib/package/tgz").install Dir["*.tgz"]
	 system "/bin/ksh", "bin/package", "read"
	 ENV.refurbish_args
	 kshcppdefines = "-DSHOPT_SPAWN=0 -D_ast_int8_t=int64_t -D_lib_memccpy"
	 system "/bin/ksh", "bin/package", "make", "CCFLAGS=#{kshcppdefines}"
	 bin.install "arch/darwin.i386-64/bin/ksh" => "ksh93"
	 bin.install_symlink "ksh93" => "ksh"
	 man1.install "arch/darwin.i386-64/man/man1/sh.1" => "ksh93.1"
	 man1.install_symlink "ksh93.1" => "ksh.1"
