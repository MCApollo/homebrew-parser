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
	 end
	 version_suffix = version.to_s.slice(/\d/)
	 ENV["gcc_cv_prog_makeinfo_modern"] = "no"
	 args = [
	 "--build=#{arch}-apple-darwin#{osmajor}",
	 "--prefix=#{prefix}",
	 "--libdir=#{lib}/gcc/#{version_suffix}",
	 "--enable-languages=#{languages.join(",")}",
	 "--program-suffix=-#{version_suffix}",
	 "--with-gmp=#{Formula["gmp"].opt_prefix}",
	 "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
	 "--with-mpc=#{Formula["libmpc"].opt_prefix}",
	 "--with-system-zlib",
	 "--enable-libstdcxx-time=yes",
	 "--enable-stage1-checking",
	 "--enable-checking=release",
	 "--enable-lto",
	 "--enable-plugin",
	 "--disable-werror",
	 "--with-pkgversion=Homebrew GCC #{pkg_version} #{build.used_options*" "}".strip,
	 "--with-bugurl=https://github.com/Homebrew/homebrew-core/issues",
	 ]
	 args << "--disable-nls" if build.without? "nls"
	 args << "--with-dwarf2" if MacOS.version <= :mountain_lion
	 if MacOS.prefer_64_bit?
	 args << "--enable-multilib"
	 else
	 args << "--disable-multilib"
	 end
	 args << "--enable-host-shared" if build.with?("jit") || build.with?("all-languages")
	 inreplace "libgcc/config/t-slibgcc-darwin", "@shlib_slibdir@", "#{HOMEBREW_PREFIX}/lib/gcc/#{version_suffix}"
	 mkdir "build" do
	 unless MacOS::CLT.installed?
	 args << "--with-native-system-header-dir=/usr/include"
	 args << "--with-sysroot=#{MacOS.sdk_path}"
	 end
	 system "../configure", *args
	 if build.with? "profiled-build"
	 system "make", "profiledbootstrap"
	 else
	 system "make", "bootstrap"
	 end
	 system "make", "install"
	 end
	 Dir.glob(man7/"*.7") { |file| add_suffix file, version_suffix }
	 info.rmtree
