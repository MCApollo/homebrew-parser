name :
	 Bwfmetaedit
homepage :
	 https://mediaarea.net/BWFMetaEdit
url :
	 https://mediaarea.net/download/binary/bwfmetaedit/1.3.6/BWFMetaEdit_CLI_1.3.6_GNU_FromSource.tar.bz2
description :
	 Tool for embedding, validating, and exporting BWF file metadata
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "Project/GNU/CLI" do
	 system "./configure",  "--disable-debug", "--prefix=#{prefix}"
	 system "make", "install"
