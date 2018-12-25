name :
	 Pari
homepage :
	 https://pari.math.u-bordeaux.fr/
url :
	 https://pari.math.u-bordeaux.fr/pub/pari/unix/pari-2.11.0.tar.gz
description :
	 Computer algebra system designed for fast computations in number theory
build_deps :
link_deps :
	 gmp
	 readline
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 readline = Formula["readline"].opt_prefix
	 gmp = Formula["gmp"].opt_prefix
	 system "./Configure", "--prefix=#{prefix}",
	 "--with-gmp=#{gmp}",
	 "--with-readline=#{readline}"
	 system "make", "all"
	 system "make", "install"
