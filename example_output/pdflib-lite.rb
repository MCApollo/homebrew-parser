name :
	 PdflibLite
homepage :
	 https://www.pdflib.com/download/free-software/pdflib-lite-7/
url :
	 https://dl.bintray.com/homebrew/mirror/pdflib-lite--7.0.5p3.tar.xz
description :
	 Subset of the functionality of PDFlib 7
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
	 ENV["CPPFLAGS"] = "-isystem#{prefix}"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-java",
	 "--without-perl",
	 "--without-py",
	 "--without-tcl",
	 "--without-ruby"
	 system "make"
	 system "make", "install"
