name :
	 Deheader
homepage :
	 http://www.catb.org/~esr/deheader
url :
	 http://www.catb.org/~esr/deheader/deheader-1.6.tar.gz
description :
	 Analyze C/C++ files for unnecessary headers
build_deps :
	 xmlto
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "/usr/bin/tar", "-xvqf", "deheader-1.6.tar.gz",
	 "deheader-1.6/deheader.1"
	 system "/usr/bin/tar", "-xvf", "deheader-1.6.tar.gz", "--exclude",
	 "deheader-1.6/deheader.1"
	 cd "deheader-1.6" do
	 system "make"
	 bin.install "deheader"
	 man1.install "deheader.1"
	 end
