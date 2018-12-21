name :
	 T1utils
homepage :
	 https://www.lcdf.org/type/
url :
	 https://www.lcdf.org/type/t1utils-1.41.tar.gz
description :
	 Command-line tools for dealing with Type 1 fonts
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
