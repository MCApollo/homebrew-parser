name :
	 Calc
homepage :
	 http://www.isthe.com/chongo/tech/comp/calc/
url :
	 https://downloads.sourceforge.net/project/calc/calc/2.12.7.1/calc-2.12.7.1.tar.bz2
description :
	 Arbitrary precision calculator
build_deps :
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV["EXTRA_CFLAGS"] = ENV.cflags
	 ENV["EXTRA_LDFLAGS"] = ENV.ldflags
	 readline = Formula["readline"]
	 system "make", "install", "INCDIR=#{MacOS.sdk_path}/usr/include",
	 "BINDIR=#{bin}",
	 "LIBDIR=#{lib}",
	 "MANDIR=#{man1}",
	 "CALC_INCDIR=#{include}/calc",
	 "CALC_SHAREDIR=#{pkgshare}",
	 "USE_READLINE=-DUSE_READLINE",
	 "READLINE_LIB=-L#{readline.opt_lib} -lreadline",
	 "READLINE_EXTRAS=-lhistory -lncurses"
	 libexec.install "#{bin}/cscript"
