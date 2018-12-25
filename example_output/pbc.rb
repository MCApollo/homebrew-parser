name :
	 Pbc
homepage :
	 https://crypto.stanford.edu/pbc/
url :
	 https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz
description :
	 Pairing-based cryptography
build_deps :
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
