name :
	 Ski
homepage :
	 http://catb.org/~esr/ski/
url :
	 http://www.catb.org/~esr/ski/ski-6.12.tar.gz
description :
	 Evade the deadly Yeti on your jet-powered skis
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "make"
