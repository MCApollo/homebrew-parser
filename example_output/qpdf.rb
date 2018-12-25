name :
	 Qpdf
homepage :
	 https://github.com/qpdf/qpdf
url :
	 https://github.com/qpdf/qpdf/releases/download/release-qpdf-8.2.1/qpdf-8.2.1.tar.gz
description :
	 Tools for and transforming and inspecting PDF files
build_deps :
link_deps :
	 jpeg
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
