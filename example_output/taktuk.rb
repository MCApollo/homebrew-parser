name :
	 Taktuk
homepage :
	 http://taktuk.gforge.inria.fr/
url :
	 https://gforge.inria.fr/frs/download.php/file/37055/taktuk-3.7.7.tar.gz
description :
	 Deploy commands to (a potentially large set of) remote nodes
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
