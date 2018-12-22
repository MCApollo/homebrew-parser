name :
	 Djvu2pdf
homepage :
	 http://0x2a.at/s/projects/djvu2pdf
url :
	 http://0x2a.at/site/projects/djvu2pdf/djvu2pdf-0.9.2.tar.gz
description :
	 Small tool to convert Djvu files to PDF files
build_deps :
link_deps :
	 djvulibre
	 ghostscript
conflicts :
patches :
EOF_patch :
install :
	 bin.install "djvu2pdf"
	 man1.install "djvu2pdf.1.gz"
