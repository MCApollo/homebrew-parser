name :
	 Eventql
homepage :
	 https://eventql.io
url :
	 https://github.com/eventql/eventql/releases/download/v0.4.1/eventql-0.4.1.tgz
description :
	 Database for large-scale event analytics
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
	 ENV.deparallelize
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
