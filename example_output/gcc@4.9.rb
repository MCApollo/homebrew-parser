name :
	 GccAT49
homepage :
	 https://gcc.gnu.org/
url :
	 https://ftp.gnu.org/gnu/gcc/gcc-4.9.4/gcc-4.9.4.tar.bz2
description :
	 The GNU Compiler Collection
build_deps :
link_deps :
	 :maximum_macos
optional_deps :
conflicts :
resource :
	 ['gmp', 'mpfr', 'mpc', 'isl', 'cloog']
	 ['https://ftp.gnu.org/gnu/gmp/gmp-4.3.2.tar.bz2', 'https://raw.githubusercontent.com/Homebrew/formula-patches/010a4dc3/gmp%404/4.3.2.patch', 'https://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2', 'https://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz', 'https://gcc.gnu.org/pub/gcc/infrastructure/isl-0.12.2.tar.bz2', 'https://www.bastoul.net/cloog/pages/download/count.php3?url=./cloog-0.18.4.tar.gz']
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/c2dae73416/gcc%404.9/xcode9.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/b7c7883d/gcc%404.9/high_sierra_2.patch
EOF_patch :
install :
	 ENV.delete "LD"
	 resources.each { |r| r.stage(buildpath/r.name) }
	 version_suffix = version.to_s.slice(/\d\.\d/)
	 args = [
	 "--build=#{arch}-apple-darwin#{osmajor}",
	 "--prefix=#{prefix}",
	 "--libdir=#{lib}/gcc/#{version_suffix}",
	 "--enable-languages=c,c++,fortran,objc,obj-c++",
	 "--program-suffix=-#{version_suffix}",
	 "--with-system-zlib",
	 "--enable-libstdcxx-time=yes",
	 "--enable-stage1-checking",
	 "--enable-checking=release",
	 "--enable-lto",
	 "--enable-plugin",
	 "--with-build-config=bootstrap-debug",
	 "--disable-werror",
	 "--with-pkgversion=Homebrew GCC #{pkg_version} #{build.used_options*" "}".strip,
	 "--with-bugurl=https://github.com/Homebrew/homebrew-core/issues",
	 "MAKEINFO=missing",
	 ]
	 args << "--disable-nls" if build.without? "nls"
	 if MacOS.prefer_64_bit?
	 args << "--enable-multilib"
	 else
	 args << "--disable-multilib"
	 end
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
