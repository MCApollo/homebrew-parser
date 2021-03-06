name :
	 MediaInfo
homepage :
	 https://mediaarea.net/
url :
	 https://mediaarea.net/download/binary/mediainfo/18.12/MediaInfo_CLI_18.12_GNU_FromSource.tar.bz2
description :
	 Unified display of technical and tag data for audio/video
build_deps :
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "ZenLib/Project/GNU/Library" do
	 args = ["--disable-debug",
	 "--disable-dependency-tracking",
	 "--enable-static",
	 "--enable-shared",
	 "--prefix=#{prefix}"]
	 system "./configure", *args
	 system "make", "install"
	 end
	 cd "MediaInfoLib/Project/GNU/Library" do
	 args = ["--disable-debug",
	 "--disable-dependency-tracking",
	 "--with-libcurl",
	 "--enable-static",
	 "--enable-shared",
	 "--prefix=#{prefix}"]
	 system "./configure", *args
	 system "make", "install"
	 end
	 cd "MediaInfo/Project/GNU/CLI" do
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 end
