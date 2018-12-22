name :
	 Pdftoipe
homepage :
	 https://github.com/otfried/ipe-tools
url :
	 https://github.com/otfried/ipe-tools/archive/v7.2.7.3.tar.gz
description :
	 Reads arbitrary PDF files and generates an XML file readable by Ipe
build_deps :
	 pkg-config
link_deps :
	 poppler
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 cd "pdftoipe" do
	 system "make"
	 bin.install "pdftoipe"
	 man1.install "pdftoipe.1"
	 end
