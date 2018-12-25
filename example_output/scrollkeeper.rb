name :
	 Scrollkeeper
homepage :
	 https://scrollkeeper.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/scrollkeeper/scrollkeeper/0.3.14/scrollkeeper-0.3.14.tar.gz
description :
	 Transitional package for scrollkeeper
build_deps :
link_deps :
	 docbook
	 gettext
optional_deps :
conflicts :
	 rarian
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-xml-catalog=#{etc}/xml/catalog"
	 system "make"
	 system "make", "install"
