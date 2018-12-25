name :
	 Mktorrent
homepage :
	 https://mktorrent.sourceforge.io/
url :
	 https://github.com/Rudde/mktorrent/archive/v1.1.tar.gz
description :
	 Create BitTorrent metainfo files
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "USE_PTHREADS=1", "USE_OPENSSL=1", "USE_LONG_OPTIONS=1"
	 bin.install "mktorrent"
