name :
	 Serd
homepage :
	 https://drobilla.net/software/serd/
url :
	 https://download.drobilla.net/serd-0.28.0.tar.bz2
description :
	 C library for RDF syntax
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf"
	 system "./waf", "install"
