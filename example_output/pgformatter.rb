name :
	 Pgformatter
homepage :
	 https://sqlformat.darold.net/
url :
	 https://github.com/darold/pgFormatter/archive/v3.3.tar.gz
description :
	 PostgreSQL syntax beautifier
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "perl", "Makefile.PL", "DESTDIR=."
	 system "make", "install"
	 prefix.install (buildpath/"usr/local").children
	 (libexec/"lib").install "blib/lib/pgFormatter"
	 libexec.install bin/"pg_format"
	 bin.install_symlink libexec/"pg_format"
