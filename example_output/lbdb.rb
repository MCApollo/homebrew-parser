name :
	 Lbdb
homepage :
	 https://www.spinnaker.de/lbdb/
url :
	 https://www.spinnaker.de/lbdb/download/lbdb_0.47.tar.gz
description :
	 Little brother's database for the mutt mail reader
build_deps :
link_deps :
	 abook
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--libdir=#{lib}/lbdb"
	 system "make", "install"
