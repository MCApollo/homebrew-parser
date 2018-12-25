name :
	 Pdfpc
homepage :
	 https://pdfpc.github.io/
url :
	 https://github.com/pdfpc/pdfpc/archive/v4.2.1.tar.gz
description :
	 Presenter console with multi-monitor support for PDF files
build_deps :
	 cmake
	 vala
link_deps :
	 gtk+3
	 libgee
	 librsvg
	 poppler
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DMOVIES=off", *std_cmake_args
	 system "make", "install"
