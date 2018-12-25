name :
	 Ephemeralpg
homepage :
	 http://ephemeralpg.org
url :
	 http://ephemeralpg.org/code/ephemeralpg-2.5.tar.gz
description :
	 Run tests on an isolated, temporary Postgres database
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
	 system "make", "PREFIX=#{prefix}", "MANPREFIX=#{man}", "install"
