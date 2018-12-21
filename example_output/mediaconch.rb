name :
	 Mediaconch
homepage :
	 https://mediaarea.net/MediaConch
url :
	 https://mediaarea.net/download/binary/mediaconch/18.03.2/MediaConch_CLI_18.03.2_GNU_FromSource.tar.bz2
description :
	 Conformance checker and technical metadata reporter
build_deps :
	 pkg-config
link_deps :
	 jansson
	 libevent
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 cd "ZenLib/Project/GNU/Library" do
	 args = ["--disable-debug",
	 "--disable-dependency-tracking",
	 "--enable-shared",
	 "--enable-static",
	 "--prefix=#{prefix}",
	 "--libdir=#{lib}/mediaconch",
	 "--includedir=#{include}/mediaconch"]
	 system "./configure", *args
	 system "make", "install"
