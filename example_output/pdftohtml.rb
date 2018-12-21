name :
	 Pdftohtml
homepage :
	 https://pdftohtml.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/pdftohtml/Experimental%20Versions/pdftohtml%200.40/pdftohtml-0.40a.tar.gz
description :
	 PDF to HTML converter (based on xpdf)
build_deps :
link_deps :
conflicts :
	 poppler
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "src/pdftohtml"
