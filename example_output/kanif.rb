name :
	 Kanif
homepage :
	 http://taktuk.gforge.inria.fr/kanif/
url :
	 https://gforge.inria.fr/frs/download.php/26773/kanif-1.2.2.tar.gz
description :
	 Cluster management and administration tool
build_deps :
link_deps :
	 taktuk
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
