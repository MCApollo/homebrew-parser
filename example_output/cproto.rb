name :
	 Cproto
homepage :
	 https://invisible-island.net/cproto/
url :
	 https://invisible-mirror.net/archives/cproto/cproto-4.7m.tgz
description :
	 Generate function prototypes for functions in input files
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
	 "--prefix=#{prefix}"
	 system "make", "install"
