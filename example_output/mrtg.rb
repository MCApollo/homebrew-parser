name :
	 Mrtg
homepage :
	 https://oss.oetiker.ch/mrtg/
url :
	 https://oss.oetiker.ch/mrtg/pub/mrtg-2.17.7.tar.gz
description :
	 Multi router traffic grapher
build_deps :
link_deps :
	 gd
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
