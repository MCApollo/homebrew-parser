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
