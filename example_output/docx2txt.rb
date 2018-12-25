name :
	 Docx2txt
homepage :
	 https://docx2txt.sourceforge.io/
url :
	 https://downloads.sourceforge.net/docx2txt/docx2txt-1.4.tgz
description :
	 Converts Microsoft Office docx documents to equivalent text documents
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['sample_doc']
	 ['https://calibre-ebook.com/downloads/demos/demo.docx']
patches :
EOF_patch :
install :
	 system "make", "install", "CONFIGDIR=#{etc}", "BINDIR=#{bin}"
