name :
	 Avimetaedit
homepage :
	 https://mediaarea.net/AVIMetaEdit
url :
	 https://mediaarea.net/download/binary/avimetaedit/1.0.2/AVIMetaEdit_CLI_1.0.2_GNU_FromSource.tar.bz2
description :
	 Tool for embedding, validating, and exporting of AVI files metadata
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "Project/GNU/CLI" do
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
