name :
	 Pgbouncer
homepage :
	 https://wiki.postgresql.org/wiki/PgBouncer
url :
	 https://pgbouncer.github.io/downloads/files/1.9.0/pgbouncer-1.9.0.tar.gz
description :
	 Lightweight connection pooler for PostgreSQL
build_deps :
	 asciidoc
	 xmlto
link_deps :
	 libevent
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "./configure", "--disable-debug",
	 "--with-libevent=#{HOMEBREW_PREFIX}",
	 "--prefix=#{prefix}"
	 ln_s "../install-sh", "doc/install-sh"
	 system "make", "install"
	 bin.install "etc/mkauth.py"
	 etc.install %w[etc/pgbouncer.ini etc/userlist.txt]
