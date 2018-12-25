name :
	 Libgfshare
homepage :
	 https://www.digital-scurf.org/software/libgfshare
url :
	 https://www.digital-scurf.org/files/libgfshare/libgfshare-2.0.0.tar.bz2
description :
	 Library for sharing secrets
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
	 "--disable-silent-rules",
	 "--disable-linker-optimisations",
	 "--prefix=#{prefix}"
	 system "make", "install"
