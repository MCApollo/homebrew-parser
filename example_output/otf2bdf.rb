name :
	 Otf2bdf
homepage :
	 https://www.math.nmsu.edu/~mleisher/Software/otf2bdf/
url :
	 https://www.math.nmsu.edu/~mleisher/Software/otf2bdf/otf2bdf-3.1.tbz2
description :
	 OpenType to BDF font converter
build_deps :
link_deps :
	 freetype
optional_deps :
conflicts :
resource :
	 ['mkinstalldirs']
	 ['https://www.math.nmsu.edu/~mleisher/Software/otf2bdf/mkinstalldirs']
patches :
EOF_patch :
install :
	 buildpath.install resource("mkinstalldirs")
	 chmod 0755, "mkinstalldirs"
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
