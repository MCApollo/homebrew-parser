name :
	 Calcurse
homepage :
	 https://calcurse.org/
url :
	 https://calcurse.org/files/calcurse-4.3.0.tar.gz
description :
	 Text-based personal organizer
build_deps :
	 asciidoc
	 autoconf
	 automake
link_deps :
	 gettext
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "XML_CATALOG_FILES=/usr/local/etc/xml/catalog"
	 system "make", "install"
