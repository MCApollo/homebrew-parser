name :
	 Xmlto
homepage :
	 https://pagure.io/xmlto/
url :
	 https://releases.pagure.org/xmlto/xmlto-0.0.28.tar.bz2
description :
	 Convert XML to another format (based on XSL or other tools)
build_deps :
link_deps :
	 docbook
	 docbook-xsl
	 gnu-getopt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- xmlto-0.0.25/xmlto.in.orig
	 +++ xmlto-0.0.25/xmlto.in
	 @@ -209,7 +209,7 @@
	 export VERBOSE
	 -XSLTOPTS="$XSLTOPTS --nonet"
	 +#XSLTOPTS="$XSLTOPTS --nonet"
	 XSLTPARAMS=""
install :
	 ENV["GETOPT"] = Formula["gnu-getopt"].opt_bin/"getopt"
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 ENV.deparallelize
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
