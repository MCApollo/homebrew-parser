name :
	 Newsboat
homepage :
	 https://newsboat.org/
url :
	 https://github.com/newsboat/newsboat/archive/r2.13.tar.gz
description :
	 RSS/Atom feed reader for text terminals
build_deps :
	 asciidoc
	 docbook-xsl
	 pkg-config
link_deps :
	 gettext
	 json-c
	 libstfl
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"
	 system "make", "install", "prefix=#{prefix}"
