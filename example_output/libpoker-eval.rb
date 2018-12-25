name :
	 LibpokerEval
homepage :
	 https://pokersource.sourceforge.io/
url :
	 https://mirrorservice.org/sites/ftp.debian.org/debian/pool/main/p/poker-eval/poker-eval_138.0.orig.tar.gz
description :
	 C library to evaluate poker hands
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-dependency-tracking"
	 system "make", "install"
