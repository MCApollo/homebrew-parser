name :
	 Pgbadger
homepage :
	 https://pgbadger.darold.net/
url :
	 https://github.com/darold/pgbadger/archive/v10.1.tar.gz
description :
	 Log analyzer for PostgreSQL
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "perl", "Makefile.PL", "DESTDIR=#{buildpath}"
	 system "make"
	 system "make", "install"
	 bin.install "usr/local/bin/pgbadger"
	 man1.install "usr/local/share/man/man1/pgbadger.1p"
