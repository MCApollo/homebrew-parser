name :
	 CheckPostgres
homepage :
	 https://bucardo.org/wiki/Check_postgres
url :
	 https://bucardo.org/downloads/check_postgres-2.23.0.tar.gz
description :
	 Monitor Postgres databases
build_deps :
link_deps :
	 postgresql
conflicts :
patches :
EOF_patch :
install :
	 system "perl", "Makefile.PL", "PREFIX=#{prefix}"
	 system "make", "install"
	 mv bin/"check_postgres.pl", bin/"check_postgres"
	 inreplace [bin/"check_postgres", man1/"check_postgres.1p"], "check_postgres.pl", "check_postgres"
	 rm_rf prefix/"Library"
	 rm_rf prefix/"lib"
