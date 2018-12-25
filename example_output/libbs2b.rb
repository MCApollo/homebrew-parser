name :
	 Libbs2b
homepage :
	 https://bs2b.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/bs2b/libbs2b/3.1.0/libbs2b-3.1.0.tar.gz
description :
	 Bauer stereophonic-to-binaural DSP
build_deps :
	 pkg-config
link_deps :
	 libsndfile
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-static",
	 "--enable-shared"
	 system "make", "install"
