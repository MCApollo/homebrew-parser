name :
	 Src
homepage :
	 http://www.catb.org/~esr/src/
url :
	 http://www.catb.org/~esr/src/src-1.18.tar.gz
description :
	 Simple revision control: RCS reloaded with a modern UI
build_deps :
link_deps :
	 rcs
optional_deps :
conflicts :
	 srclib
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog" if build.head?
	 system "make", "install", "prefix=#{prefix}"
