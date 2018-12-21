name :
	 Superlu
homepage :
	 http://crd-legacy.lbl.gov/~xiaoye/SuperLU/
url :
	 http://crd-legacy.lbl.gov/~xiaoye/SuperLU/superlu_5.2.1.tar.gz
description :
	 Solve large, sparse nonsymmetric systems of equations
build_deps :
link_deps :
	 veclibfort
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 cp "MAKE_INC/make.mac-x", "./make.inc"
	 args = ["SuperLUroot=#{buildpath}",
	 "SUPERLULIB=$(SuperLUroot)/lib/libsuperlu.a",
	 "CC=#{ENV.cc}",
	 "BLASLIB=-L#{Formula["veclibfort"].opt_lib} -lvecLibFort"]
	 system "make", "lib", *args
	 lib.install Dir["lib/*"]
	 (include/"superlu").install Dir["SRC/*.h"]
	 doc.install Dir["Doc/*"]
	 pkgshare.install "EXAMPLE/dlinsol.c"
	 pkgshare.install "EXAMPLE/g20.rua"
