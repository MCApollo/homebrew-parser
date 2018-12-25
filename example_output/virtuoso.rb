name :
	 Virtuoso
homepage :
	 https://virtuoso.openlinksw.com/wiki/main/
url :
	 https://github.com/openlink/virtuoso-opensource/releases/download/v7.2.5.1/virtuoso-opensource-7.2.5.tar.gz
description :
	 High-performance object-relational SQL database
build_deps :
	 gawk
link_deps :
	 openssl
optional_deps :
conflicts :
	 unixodbc
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
