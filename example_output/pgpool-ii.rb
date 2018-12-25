name :
	 PgpoolIi
homepage :
	 https://www.pgpool.net/mediawiki/index.php/Main_Page
url :
	 https://www.pgpool.net/download.php?f=pgpool-II-3.7.5.tar.gz
description :
	 PostgreSQL connection pool server
build_deps :
link_deps :
	 postgresql
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}"
	 system "make", "install"
