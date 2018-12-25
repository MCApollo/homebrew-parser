name :
	 DiffPdf
homepage :
	 https://vslavik.github.io/diff-pdf/
url :
	 https://github.com/vslavik/diff-pdf/archive/v0.2.tar.gz
description :
	 Visually compare two PDF files
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 cairo
	 poppler
	 wxmac
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
