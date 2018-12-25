name :
	 SaxonB
homepage :
	 https://saxon.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/saxon/Saxon-B/9.1.0.8/saxonb9-1-0-8j.zip
description :
	 XSLT and XQuery processor
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
	 (buildpath/"saxon-b").install Dir["*.jar", "doc", "notices"]
	 share.install Dir["*"]
