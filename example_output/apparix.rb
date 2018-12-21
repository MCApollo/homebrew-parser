name :
	 Apparix
homepage :
	 https://micans.org/apparix/
url :
	 https://micans.org/apparix/src/apparix-11-062.tar.gz
description :
	 File system navigation via bookmarking directories
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
