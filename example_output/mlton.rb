name :
	 Mlton
homepage :
	 http://mlton.org
url :
	 https://downloads.sourceforge.net/project/mlton/mlton/20180207/mlton-20180207.src.tgz
description :
	 Whole-program, optimizing compiler for Standard ML
build_deps :
link_deps :
	 gmp
conflicts :
patches :
EOF_patch :
install :
	 bootstrap = buildpath/"bootstrap"
	 resource("bootstrap").stage do
	 args = %W[
	 WITH_GMP=#{Formula["gmp"].opt_prefix}
	 PREFIX=#{bootstrap}
	 MAN_PREFIX_EXTRA=/share
	 ]
	 system "make", *(args + ["install"])
	 end
	 ENV.prepend_path "PATH", bootstrap/"bin"
	 ENV.deparallelize
	 args = %W[
	 WITH_GMP=#{Formula["gmp"].opt_prefix}
	 DESTDIR=
	 PREFIX=#{prefix}
	 MAN_PREFIX_EXTRA=/share
	 ]
	 system "make", *(args + ["all"])
	 system "make", *(args + ["install"])
