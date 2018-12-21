name :
	 Lrdf
homepage :
	 https://github.com/swh/LRDF
url :
	 https://github.com/swh/LRDF/archive/v0.6.1.tar.gz
description :
	 RDF library for accessing plugin metadata in the LADSPA plugin system
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 raptor
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 (pkgshare/"examples").install Dir["examples/*"] - Dir["examples/Makefile*"]
