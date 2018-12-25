name :
	 Fastme
homepage :
	 http://www.atgc-montpellier.fr/fastme/
url :
	 https://gite.lirmm.fr/atgc/FastME/raw/v2.1.6/tarball/fastme-2.1.6.tar.gz
description :
	 Accurate and fast distance-based phylogeny inference program
build_deps :
link_deps :
	 gcc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
