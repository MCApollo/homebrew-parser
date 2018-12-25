name :
	 Ibex
homepage :
	 http://www.ibex-lib.org/
url :
	 https://github.com/ibex-team/ibex-lib/archive/ibex-2.7.4.tar.gz
description :
	 C++ library for constraint processing over real numbers
build_deps :
	 bison
	 flex
link_deps :
	 pkg-config
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV.deparallelize
	 system "./waf", "configure", "--prefix=#{prefix}",
	 "--enable-shared",
	 "--lp-lib=soplex",
	 "--with-optim"
	 system "./waf", "install"
	 pkgshare.install %w[examples plugins/solver/benchs]
	 (pkgshare/"examples/symb01.txt").write <<~EOS
	 function f(x)
	 return ((2*x,-x);(-x,3*x));
