name :
	 JsonC
homepage :
	 https://github.com/json-c/json-c/wiki
url :
	 https://github.com/json-c/json-c/archive/json-c-0.13.1-20180305.tar.gz
description :
	 JSON parser for C
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 ENV.deparallelize
	 system "make", "install"
