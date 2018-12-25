name :
	 Libpagemaker
homepage :
	 https://wiki.documentfoundation.org/DLP/Libraries/libpagemaker
url :
	 https://dev-www.libreoffice.org/src/libpagemaker/libpagemaker-0.0.4.tar.xz
description :
	 Imports file format of Aldus/Adobe PageMaker documents
build_deps :
	 boost
	 pkg-config
link_deps :
	 librevenge
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
	 "--prefix=#{prefix}"
	 system "make", "install"
