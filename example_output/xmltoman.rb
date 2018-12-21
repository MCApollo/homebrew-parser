name :
	 Xmltoman
homepage :
	 https://sourceforge.net/projects/xmltoman/
url :
	 https://downloads.sourceforge.net/project/xmltoman/xmltoman/xmltoman-0.4.tar.gz/xmltoman-0.4.tar.gz
description :
	 XML to manpage converter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./xmltoman xml/xmltoman.1.xml > xmltoman.1"
	 system "./xmltoman xml/xmlmantohtml.1.xml > xmlmantohtml.1"
	 man1.install %w[xmltoman.1 xmlmantohtml.1]
	 bin.install %w[xmltoman xmlmantohtml]
	 pkgshare.install %w[xmltoman.xsl xmltoman.dtd xmltoman.css]
