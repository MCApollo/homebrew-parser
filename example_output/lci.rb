name :
	 Lci
homepage :
	 https://lci.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/lci/lci/0.6/lci-0.6.tar.gz
description :
	 Interpreter for the lambda calculus
build_deps :
link_deps :
optional_deps :
conflicts :
	 lolcode
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
