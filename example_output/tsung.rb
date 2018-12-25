name :
	 Tsung
homepage :
	 http://tsung.erlang-projects.org/
url :
	 http://tsung.erlang-projects.org/dist/tsung-1.7.0.tar.gz
description :
	 Load testing for HTTP, PostgreSQL, Jabber, and others
build_deps :
link_deps :
	 erlang
	 gnuplot
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
