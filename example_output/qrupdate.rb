name :
	 Qrupdate
homepage :
	 https://sourceforge.net/projects/qrupdate/
url :
	 https://downloads.sourceforge.net/qrupdate/qrupdate-1.1.2.tar.gz
description :
	 Fast updates of QR and Cholesky decompositions
build_deps :
link_deps :
	 gcc
	 veclibfort
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "lib", "solib",
	 "BLAS=-L#{Formula["veclibfort"].opt_lib} -lvecLibFort"
	 rm "INSTALL"
	 inreplace "src/Makefile", "install -D", "install"
	 lib.mkpath
	 system "make", "install", "PREFIX=#{prefix}"
	 pkgshare.install "test/tch1dn.f", "test/utils.f"
