name :
	 Diffstat
homepage :
	 https://invisible-island.net/diffstat/
url :
	 https://invisible-mirror.net/archives/diffstat/diffstat-1.61.tgz
description :
	 Produce graph of changes introduced by a diff file
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
