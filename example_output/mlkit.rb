name :
	 Mlkit
homepage :
	 https://melsman.github.io/mlkit
url :
	 https://github.com/melsman/mlkit/archive/mlkit-4.3.15.tar.gz
description :
	 Compiler for the Standard ML programming language
build_deps :
	 autoconf
	 mlton
link_deps :
	 gmp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "sh", "./autobuild"
	 system "./configure", "--prefix=#{prefix}"
	 ENV.permit_arch_flags if MacOS.prefer_64_bit?
	 system "make", "mlkit"
	 system "make", "mlkit_libs"
	 system "make", "install"
