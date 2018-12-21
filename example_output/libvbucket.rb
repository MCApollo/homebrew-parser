name :
	 Libvbucket
homepage :
	 https://couchbase.com/develop/c/current
url :
	 https://s3.amazonaws.com/packages.couchbase.com/clients/c/libvbucket-1.8.0.4.tar.gz
description :
	 Utility library providing mapping to virtual buckets
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-docs"
	 system "make", "install"
