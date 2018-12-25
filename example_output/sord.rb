name :
	 Sord
homepage :
	 https://drobilla.net/software/sord/
url :
	 https://download.drobilla.net/sord-0.16.2.tar.bz2
description :
	 C library for storing RDF data in memory
build_deps :
	 pkg-config
link_deps :
	 pcre
	 serd
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf"
	 system "./waf", "install"
