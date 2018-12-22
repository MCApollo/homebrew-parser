name :
	 GccAT6
homepage :
	 https://gcc.gnu.org
url :
	 https://ftp.gnu.org/gnu/gcc/gcc-6.5.0/gcc-6.5.0.tar.xz
description :
	 GNU compiler collection
build_deps :
link_deps :
	 gmp
	 isl
	 libmpc
	 mpfr
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete "LD"
	 languages = %w[c c++ objc obj-c++ fortran]
	 version_suffix = version.to_s.slice(/\d/)
	 ENV["gcc_cv_prog_makeinfo_modern"] = "no"
	 osmajor = `uname -r`.chomp
	 args = [
	 "--build=x86_64-apple-darwin#{osmajor}",
	 "--prefix=#{prefix}",
	 "--libdir=#{lib}/gcc/#{version_suffix}",
	 "--enable-languages=#{languages.join(",")}",
	 "--program-suffix=-#{version_suffix}",
	 "--with-gmp=#{Formula["gmp"].opt_prefix}",
	 "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
	 "--with-mpc=#{Formula["libmpc"].opt_prefix}",
	 "--with-isl=#{Formula["isl"].opt_prefix}",
	 "--with-system-zlib",
	 "--enable-stage1-checking",
	 "--enable-checking=release",
	 "--enable-lto",
	 "--with-build-config=bootstrap-debug",
	 "--disable-werror",
	 "--with-pkgversion=Homebrew GCC #{pkg_version} #{build.used_options*" "}".strip,
	 "--with-bugurl=https://github.com/Homebrew/homebrew-core/issues",
	 "--disable-nls",
	 ]
	 args << "--with-dwarf2" if MacOS.version <= :mountain_lion
	 args << "--disable-multilib" if DevelopmentTools.clang_build_version >= 1000
	 inreplace "libgcc/config/t-slibgcc-darwin", "@shlib_slibdir@", "#{HOMEBREW_PREFIX}/lib/gcc/#{version_suffix}"
	 mkdir "build" do
	 if !MacOS::CLT.installed?
	 args << "--with-native-system-header-dir=/usr/include"
	 args << "--with-sysroot=#{MacOS.sdk_path}"
	 elsif MacOS.version >= :mojave
	 args << "--with-native-system-header-dir=/usr/include"
	 args << "--with-sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
	 end
	 system "../configure", *args
	 system "make", "bootstrap"
	 system "make", "install"
