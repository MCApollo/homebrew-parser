name :
	 Libmwaw
homepage :
	 https://sourceforge.net/p/libmwaw/wiki/Home/
url :
	 https://downloads.sourceforge.net/project/libmwaw/libmwaw/libmwaw-0.3.14/libmwaw-0.3.14.tar.xz
description :
	 Library for converting legacy Mac document formats
build_deps :
	 pkg-config
link_deps :
	 librevenge
optional_deps :
conflicts :
resource :
	 ['test_document']
	 ['https://github.com/openpreserve/format-corpus/raw/825c8a5af012a93cf7aac408b0396e03a4575850/office-examples/Old%20Word%20file/NEWSSLID.DOC']
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
