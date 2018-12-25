name :
	 Ilmbase
homepage :
	 https://www.openexr.com/
url :
	 https://download.savannah.nongnu.org/releases/openexr/ilmbase-2.2.1.tar.gz
description :
	 OpenEXR ILM Base libraries (high dynamic-range image file format)
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
	 "--prefix=#{prefix}"
	 system "make", "install"
	 pkgshare.install %w[Half HalfTest Iex IexMath IexTest IlmThread Imath ImathTest]
