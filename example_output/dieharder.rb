name :
	 Dieharder
homepage :
	 https://www.phy.duke.edu/~rgb/General/dieharder.php
url :
	 https://www.phy.duke.edu/~rgb/General/dieharder/dieharder-3.31.1.tgz
description :
	 Random number test suite
build_deps :
link_deps :
	 gsl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-shared"
	 system "make", "install"
