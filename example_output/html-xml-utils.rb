name :
	 HtmlXmlUtils
homepage :
	 https://www.w3.org/Tools/HTML-XML-utils/
url :
	 https://www.w3.org/Tools/HTML-XML-utils/html-xml-utils-7.7.tar.gz
description :
	 Tools for manipulating HTML and XML files
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
	 ENV.append "CFLAGS", "-std=gnu89"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
