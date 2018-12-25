name :
	 Dvanalyzer
homepage :
	 https://mediaarea.net/DVAnalyzer
url :
	 https://mediaarea.net/download/binary/dvanalyzer/1.4.2/DVAnalyzer_CLI_1.4.2_GNU_FromSource.tar.bz2
description :
	 Quality control tool for examining tape-to-file DV streams
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
	 cd "ZenLib/Project/GNU/Library" do
	 args = ["--disable-debug",
	 "--enable-static",
	 "--disable-shared"]
	 system "./configure", *args
	 system "make"
	 end
	 cd "MediaInfoLib/Project/GNU/Library" do
	 args = ["--disable-debug",
	 "--enable-static",
	 "--disable-shared"]
	 system "./configure", *args
	 system "make"
	 end
	 cd "AVPS_DV_Analyzer/Project/GNU/CLI" do
	 system "./configure",  "--disable-debug", "--enable-staticlibs", "--prefix=#{prefix}"
	 system "make", "install"
	 end
