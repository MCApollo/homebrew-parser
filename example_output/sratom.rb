name :
	 Sratom
homepage :
	 https://drobilla.net/software/sratom/
url :
	 https://download.drobilla.net/sratom-0.6.0.tar.bz2
description :
	 Library for serializing LV2 atoms to/from RDF
build_deps :
	 pkg-config
link_deps :
	 lv2
	 serd
	 sord
conflicts :
patches :
EOF_patch :
install :
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf"
	 system "./waf", "install"
