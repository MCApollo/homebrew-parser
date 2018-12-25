name :
	 Pgroonga
homepage :
	 https://pgroonga.github.io/
url :
	 https://packages.groonga.org/source/pgroonga/pgroonga-2.1.6.tar.gz
description :
	 PostgreSQL plugin to use Groonga as index
build_deps :
	 pkg-config
link_deps :
	 groonga
	 postgresql
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 mkdir "stage"
	 system "make", "install", "DESTDIR=#{buildpath}/stage"
	 lib.install Dir["stage/**/lib/*"]
	 (share/"postgresql/extension").install Dir["stage/**/share/postgresql/extension/*"]
