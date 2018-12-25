name :
	 Xpdf
homepage :
	 https://www.xpdfreader.com/
url :
	 https://xpdfreader-dl.s3.amazonaws.com/xpdf-4.00.tar.gz
description :
	 PDF viewer
build_deps :
	 cmake
link_deps :
	 freetype
	 qt
optional_deps :
conflicts :
	 pdf2image
	 poppler
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace ["xpdf/CMakeLists.txt", "xpdf-qt/CMakeLists.txt"], " man/",
	 " share/man/"
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
