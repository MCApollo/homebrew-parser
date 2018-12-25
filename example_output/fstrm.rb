name :
	 Fstrm
homepage :
	 https://github.com/farsightsec/fstrm
url :
	 https://dl.farsightsecurity.com/dist/fstrm/fstrm-0.4.0.tar.gz
description :
	 Frame Streams implementation in C
build_deps :
	 pkg-config
link_deps :
	 libevent
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
