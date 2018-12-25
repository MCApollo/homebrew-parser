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
optional_deps :
	 llvm
conflicts :
resource :
	 []
	 []
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
	 end
	 args = %W[
	 RC_ProjectSourceVersion=#{version}
	 USE_DEPENDENCY_FILE=NO
	 BUILD_DYLIBS=NO
	 CC=#{ENV.cc}
	 CXX=#{ENV.cxx}
	 LTO=#{"-DLTO_SUPPORT" if build.with? "llvm"}
	 RC_CFLAGS=#{ENV.cflags}
	 TRIE=
	 RC_OS="macos"
	 DSTROOT=#{prefix}
	 ]
	 args << "SDK=-std=gnu99"
	 if Hardware::CPU.intel?
	 archs = "i386 x86_64"
	 else
	 archs = "ppc i386 x86_64"
	 end
	 args << "RC_ARCHS=#{archs}"
	 system "make", "install_tools", *args
	 man.install Dir["#{prefix}/usr/local/man/*"]
	 prefix.install Dir["#{prefix}/usr/local/*"]
	 bin.install Dir["#{prefix}/usr/bin/*"]
	 (include/"mach-o").install Dir["#{prefix}/usr/include/mach-o/*"]
	 man1.install Dir["#{prefix}/usr/share/man/man1/*"]
	 man3.install Dir["#{prefix}/usr/share/man/man3/*"]
	 man5.install Dir["#{prefix}/usr/share/man/man5/*"]
	 if MacOS.version >= :snow_leopard
	 (libexec/"as").install Dir["#{prefix}/usr/libexec/as/*"]
	 else
	 (libexec/"gcc/darwin").install Dir["#{prefix}/usr/libexec/gcc/darwin/*"]
	 share.install Dir["#{prefix}/usr/share/gprof.*"]
	 end
