name :
	 Cctools
homepage :
	 https://opensource.apple.com/
url :
	 https://opensource.apple.com/tarballs/cctools/cctools-855.tar.gz
description :
	 Binary and cross-compilation tools for Apple
build_deps :
	 cctools-headers
link_deps :
	 :ld64
	 llvm
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/db27850/cctools/cctools-829-lto.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/db27850/cctools/PR-37520.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/db27850/cctools/cctools-839-static-dis_info.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/db27850/cctools/libtool-no-lto.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/db27850/cctools/snowleopard-strnlen.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/db27850/cctools/cctools-806-lto.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/db27850/cctools/PR-9087924.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/db27850/cctools/PR-9830754.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/db27850/cctools/cctools-822-no-lto.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/db27850/cctools/PR-11136237.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/db27850/cctools/PR-12475288.patch
EOF_patch :
install :
	 ENV.deparallelize
	 if build.with? "llvm"
	 inreplace "libstuff/lto.c", "@@LLVM_LIBDIR@@", Formula["llvm"].opt_lib
