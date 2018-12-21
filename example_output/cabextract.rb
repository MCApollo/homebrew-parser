name :
	 Cabextract
homepage :
	 https://www.cabextract.org.uk/
url :
	 https://www.cabextract.org.uk/cabextract-1.9.tar.gz
description :
	 Extract files from Microsoft cabinet files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
