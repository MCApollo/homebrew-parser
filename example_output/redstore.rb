name :
	 Redstore
homepage :
	 https://www.aelius.com/njh/redstore/
url :
	 https://www.aelius.com/njh/redstore/redstore-0.5.4.tar.gz
description :
	 Lightweight RDF triplestore powered by Redland
build_deps :
	 pkg-config
link_deps :
	 redland
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
