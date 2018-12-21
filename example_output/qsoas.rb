name :
	 Qsoas
homepage :
	 http://bip.cnrs-mrs.fr/bip06/qsoas/
url :
	 http://bip.cnrs-mrs.fr/bip06/qsoas/downloads/qsoas-2.2.0.tar.gz
description :
	 Versatile software for data analysis
build_deps :
link_deps :
	 gsl
	 mruby
	 qt
conflicts :
patches :
EOF_patch :
install :
	 gsl = Formula["gsl"].opt_prefix
	 mruby = Formula["mruby"].opt_prefix
	 system "qmake", "MRUBY_DIR=#{mruby}", "GSL_DIR=#{gsl}/include",
	 "QMAKE_LFLAGS=-L#{mruby}/lib -L#{gsl}/lib"
	 system "make"
	 prefix.install "QSoas.app"
	 bin.write_exec_script "#{prefix}/QSoas.app/Contents/MacOS/QSoas"
