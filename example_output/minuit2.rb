name :
	 Minuit2
homepage :
	 https://seal.web.cern.ch/seal/snapshot/work-packages/mathlibs/minuit/
url :
	 https://www.cern.ch/mathlibs/sw/5_34_14/Minuit2/Minuit2-5.34.14.tar.gz
description :
	 Physics analysis tool for function minimization
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
	 system "./configure", "--disable-dependency-tracking",
	 "--with-pic",
	 "--disable-openmp",
	 "--prefix=#{prefix}"
	 system "make", "install"
