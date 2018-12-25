name :
	 Flickcurl
homepage :
	 http://librdf.org/flickcurl/
url :
	 http://download.dajobe.org/flickcurl/flickcurl-1.26.tar.gz
description :
	 Library for the Flickr API
build_deps :
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
