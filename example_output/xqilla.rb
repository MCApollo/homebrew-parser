name :
	 Xqilla
homepage :
	 https://xqilla.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/xqilla/XQilla-2.3.4.tar.gz
description :
	 XQuery and XPath 2 command-line interpreter
build_deps :
link_deps :
	 xerces-c
optional_deps :
conflicts :
	 zorba
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--with-xerces=#{HOMEBREW_PREFIX}",
	 "--prefix=#{prefix}"
	 system "make", "install"
