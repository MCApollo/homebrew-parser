name :
	 GccAT5
homepage :
	 https://gcc.gnu.org/
url :
	 https://ftp.gnu.org/gnu/gcc/gcc-5.5.0/gcc-5.5.0.tar.xz
description :
	 The GNU Compiler Collection
build_deps :
link_deps :
	 :maximum_macos
	 gmp
	 libmpc
	 mpfr
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/64fd2d52/gcc%405/5.4.0.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/078797f1b9/gcc%405/xcode9.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/413cfac6/gcc%405/10.13_headers.patch
EOF_patch :
install :
	 ENV.delete "LD"
	 resource("isl").stage buildpath/"isl"
	 if build.with? "all-languages"
	 languages = %w[c c++ fortran objc obj-c++ jit]
	 else
	 languages = %w[c c++ objc obj-c++]
	 languages << "fortran" if build.with? "fortran"
	 languages << "jit" if build.with? "jit"
