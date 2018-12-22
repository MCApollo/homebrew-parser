name :
	 Traildb
homepage :
	 http://traildb.io/
url :
	 https://github.com/traildb/traildb/archive/0.6.tar.gz
description :
	 Blazingly-fast database for log-structured data
build_deps :
	 pkg-config
link_deps :
	 libarchive
conflicts :
patches :
EOF_patch :
install :
	 judyprefix = "#{buildpath}/resources/judy"
	 resource("judy").stage do
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--disable-shared", "--prefix=#{judyprefix}"
	 ENV.deparallelize do
	 system "make", "-j1", "install"
	 end
	 end
	 ENV["PREFIX"] = prefix
	 ENV.append "CFLAGS", "-I#{judyprefix}/include"
	 ENV.append "LDFLAGS", "-L#{judyprefix}/lib"
	 system "./waf", "configure", "install"
