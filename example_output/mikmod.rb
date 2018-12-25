name :
	 Mikmod
homepage :
	 https://mikmod.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/mikmod/mikmod/3.2.8/mikmod-3.2.8.tar.gz
description :
	 Portable tracked music player
build_deps :
link_deps :
	 libmikmod
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
