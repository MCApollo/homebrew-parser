name :
	 EbookTools
homepage :
	 https://sourceforge.net/projects/ebook-tools/
url :
	 https://downloads.sourceforge.net/project/ebook-tools/ebook-tools/0.2.2/ebook-tools-0.2.2.tar.gz
description :
	 Access and convert several ebook formats
build_deps :
	 cmake
link_deps :
	 libzip
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".",
	 "-DLIBZIP_INCLUDE_DIR=#{Formula["libzip"].lib}/libzip/include",
	 *std_cmake_args
	 system "make", "install"
