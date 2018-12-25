name :
	 Libfreehand
homepage :
	 https://wiki.documentfoundation.org/DLP/Libraries/libfreehand
url :
	 https://dev-www.libreoffice.org/src/libfreehand/libfreehand-0.1.2.tar.xz
description :
	 Interpret and import Aldus/Macromedia/Adobe FreeHand documents
build_deps :
	 boost
	 pkg-config
link_deps :
	 icu4c
	 librevenge
	 little-cms2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--without-docs",
	 "--disable-dependency-tracking",
	 "--enable-static=no",
	 "--disable-werror",
	 "--disable-tests",
	 "--prefix=#{prefix}"
	 system "make", "install"
