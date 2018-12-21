name :
	 Grap
homepage :
	 https://www.lunabase.org/~faber/Vault/software/grap/
url :
	 https://www.lunabase.org/~faber/Vault/software/grap/grap-1.45.tar.gz
description :
	 Language for typesetting graphs
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-example-dir=#{pkgshare}/examples"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
