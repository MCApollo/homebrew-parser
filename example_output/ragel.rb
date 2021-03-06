name :
	 Ragel
homepage :
	 https://www.colm.net/open-source/ragel/
url :
	 https://www.colm.net/files/ragel/ragel-6.10.tar.gz
description :
	 State machine compiler
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['pdf']
	 ['https://www.colm.net/files/ragel/ragel-guide-6.10.pdf']
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
	 doc.install resource("pdf")
