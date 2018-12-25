name :
	 Gcc
homepage :
	 https://gcc.gnu.org/
url :
description :
	 GNU compiler collection
build_deps :
link_deps :
	 gmp
	 isl
	 libmpc
	 mpfr
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/gcc/graphite.h b/gcc/graphite.h
	 index 4e0e58c..be0a22b 100644
	 --- a/gcc/graphite.h
	 +++ b/gcc/graphite.h
	 @@ -37,6 +37,8 @@ along with GCC; see the file COPYING3.  If not see
	 #include <isl/schedule.h>
	 #include <isl/ast_build.h>
	 #include <isl/schedule_node.h>
	 +#include <isl/id.h>
	 +#include <isl/space.h>
	 typedef struct poly_dr *poly_dr_p;
install :
	 ENV.delete "LD"
	 languages = %w[c c++ objc obj-c++ fortran]
	 languages << "d" if build.head?
	 osmajor = `uname -r`.chomp
	 pkgversion = "Homebrew GCC #{pkg_version} #{build.used_options*" "}".strip
	 args = %W[
	 --build=x86_64-apple-darwin#{osmajor}
	 --prefix=#{prefix}
	 --libdir=#{lib}/gcc/#{version_suffix}
	 --disable-nls
	 --enable-checking=release
	 --enable-languages=#{languages.join(",")}
	 --program-suffix=-#{version_suffix}
	 --with-gmp=#{Formula["gmp"].opt_prefix}
	 --with-mpfr=#{Formula["mpfr"].opt_prefix}
	 --with-mpc=#{Formula["libmpc"].opt_prefix}
	 --with-isl=#{Formula["isl"].opt_prefix}
	 --with-system-zlib
	 --with-pkgversion=#{pkgversion}
	 --with-bugurl=https://github.com/Homebrew/homebrew-core/issues
	 ]
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
	 make_args = []
	 if build.bottle?
	 make_args << "BOOT_LDFLAGS=-Wl,-headerpad_max_install_names"
	 end
	 system "make", *make_args
	 system "make", "install"
	 bin.install_symlink bin/"gfortran-#{version_suffix}" => "gfortran"
	 end
	 Dir.glob(man7/"*.7") { |file| add_suffix file, version_suffix }
	 info.rmtree
