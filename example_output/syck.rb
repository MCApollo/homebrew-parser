name :
	 Syck
homepage :
	 https://wiki.github.com/indeyets/syck/
url :
	 https://github.s3.amazonaws.com/downloads/indeyets/syck/syck-0.70.tar.gz
description :
	 Extension for reading and writing YAML
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
