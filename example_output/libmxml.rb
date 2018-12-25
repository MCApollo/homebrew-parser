name :
	 Libmxml
homepage :
	 https://michaelrsweet.github.io/mxml/
url :
	 https://github.com/michaelrsweet/mxml/releases/download/v2.12/mxml-2.12.tar.gz
description :
	 Mini-XML library
build_deps :
	 :xcode
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--enable-shared",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
