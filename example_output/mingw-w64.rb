name :
	 MingwW64
homepage :
	 https://mingw-w64.org/
url :
	 https://downloads.sourceforge.net/project/mingw-w64/mingw-w64/mingw-w64-release/mingw-w64-v5.0.4.tar.bz2
description :
	 Minimalist GNU for Windows and GCC cross-compilers
build_deps :
	 texinfo
link_deps :
	 gmp
	 isl
	 libmpc
	 mpfr
conflicts :
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
	 target_archs.each do |arch|
	 arch_dir = "#{prefix}/toolchain-#{arch}"
	 target = "#{arch}-w64-mingw32"
	 resource("binutils").stage do
	 args = %W[
	 --target=#{target}
	 --prefix=#{arch_dir}
	 --enable-targets=#{target}
	 --disable-multilib
	 ]
	 mkdir "build-#{arch}" do
	 system "../configure", *args
	 system "make"
	 system "make", "install"
	 end
	 end
	 ENV.prepend_path "PATH", "#{arch_dir}/bin"
	 mkdir "mingw-w64-headers/build-#{arch}" do
	 system "../configure", "--host=#{target}", "--prefix=#{arch_dir}/#{target}"
	 system "make"
	 system "make", "install"
	 end
	 ln_s "#{arch_dir}/#{target}", "#{arch_dir}/mingw"
	 resource("gcc").stage buildpath/"gcc"
	 args = %W[
	 --target=#{target}
	 --prefix=#{arch_dir}
	 --with-bugurl=https://github.com/Homebrew/homebrew-core/issues
	 --enable-languages=c,c++,fortran
	 --with-ld=#{arch_dir}/bin/#{target}-ld
	 --with-as=#{arch_dir}/bin/#{target}-as
	 --with-gmp=#{Formula["gmp"].opt_prefix}
	 --with-mpfr=#{Formula["mpfr"].opt_prefix}
	 --with-mpc=#{Formula["libmpc"].opt_prefix}
	 --with-isl=#{Formula["isl"].opt_prefix}
	 --disable-multilib
	 ]
	 if build.with? "posix"
	 args << "--enable-threads=posix"
	 else
	 args << "--enable-threads=win32"
	 end
	 mkdir "#{buildpath}/gcc/build-#{arch}" do
	 system "../configure", *args
	 system "make", "all-gcc"
	 system "make", "install-gcc"
	 end
	 args = %W[
	 CC=#{target}-gcc
	 CXX=#{target}-g++
	 CPP=#{target}-cpp
	 --host=#{target}
	 --prefix=#{arch_dir}/#{target}
	 ]
	 if arch == "i686"
	 args << "--enable-lib32" << "--disable-lib64"
	 elsif arch == "x86_64"
	 args << "--disable-lib32" << "--enable-lib64"
