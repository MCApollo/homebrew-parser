name :
	 Rdfind
homepage :
	 https://rdfind.pauldreik.se/
url :
	 https://rdfind.pauldreik.se/rdfind-1.3.5.tar.gz
description :
	 Find duplicate files based on content (NOT file names)
build_deps :
link_deps :
	 nettle
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
	 "--prefix=#{prefix}"
	 system "make", "install"
