name :
	 DocbookXsl
homepage :
	 https://docbook.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/docbook/docbook-xsl/1.79.1/docbook-xsl-1.79.1.tar.bz2
description :
	 XML vocabulary to create presentation-neutral documents
build_deps :
link_deps :
	 docbook
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 doc_files = %w[AUTHORS BUGS COPYING NEWS README RELEASE-NOTES.txt TODO VERSION VERSION.xsl]
	 xsl_files = %w[assembly catalog.xml common docsrc eclipse epub epub3 extensions
	 fo highlighting html htmlhelp images javahelp lib log manpages
	 params profiling roundtrip slides template tests tools webhelp
	 website xhtml xhtml-1_1 xhtml5]
	 (prefix/"docbook-xsl").install xsl_files + doc_files
	 resource("ns").stage do
	 (prefix/"docbook-xsl-ns").install xsl_files + doc_files
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 [prefix/"docbook-xsl/catalog.xml", prefix/"docbook-xsl-ns/catalog.xml"].each do |catalog|
	 system "xmlcatalog", "--noout", "--del", "file://#{catalog}", "#{etc}/xml/catalog"
	 system "xmlcatalog", "--noout", "--add", "nextCatalog", "", "file://#{catalog}", "#{etc}/xml/catalog"
