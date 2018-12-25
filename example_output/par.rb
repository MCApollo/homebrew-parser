name :
	 Par
homepage :
	 http://www.nicemice.net/par/
url :
	 http://www.nicemice.net/par/Par152.tar.gz
description :
	 Paragraph reflow for email
build_deps :
link_deps :
optional_deps :
conflicts :
	 rancid
resource :
	 []
	 []
patches :
	 http://sysmic.org/dl/par/par-1.52-i18n.4.patch
EOF_patch :
install :
	 system "make", "-f", "protoMakefile"
	 bin.install "par"
	 man1.install gzip("par.1")
