name :
	 Speex
homepage :
	 https://speex.org/
url :
	 https://downloads.xiph.org/releases/speex/speex-1.2.0.tar.gz
description :
	 Audio codec designed for speech
build_deps :
	 pkg-config
link_deps :
	 libogg
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-dependency-tracking"
	 system "make", "install"
