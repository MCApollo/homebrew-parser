name :
	 Enca
homepage :
	 https://cihar.com/software/enca/
url :
	 https://dl.cihar.com/enca/enca-1.19.tar.gz
description :
	 Charset analyzer and converter
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
