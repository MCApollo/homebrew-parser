name :
	 XmlCoreutils
homepage :
	 https://www.lbreyer.com/xml-coreutils.html
url :
	 https://www.lbreyer.com/gpl/xml-coreutils-0.8.1.tar.gz
description :
	 Powerful interactive system for text processing
build_deps :
link_deps :
	 s-lang
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
