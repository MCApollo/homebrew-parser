name :
	 PgTop
homepage :
	 https://git.postgresql.org/gitweb/?p=pg_top.git
url :
	 https://ftp.postgresql.org/pub/projects/pgFoundry/ptop/pg_top/3.7.0/pg_top-3.7.0.tar.bz2
description :
	 Monitor PostgreSQL processes
build_deps :
link_deps :
	 postgresql
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 (buildpath/"config.h").append_lines "#define HAVE_DECL_STRLCPY 1" if MacOS.version >= :mavericks
	 system "make", "install"
