name :
	 Pdfcrack
homepage :
	 https://pdfcrack.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/pdfcrack/pdfcrack/pdfcrack-0.16/pdfcrack-0.16.tar.gz
description :
	 PDF files password cracker
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
	 system "make", "all"
	 bin.install "pdfcrack"
