name :
	 Libcdr
homepage :
	 https://wiki.documentfoundation.org/DLP/Libraries/libcdr
url :
	 https://dev-www.libreoffice.org/src/libcdr/libcdr-0.1.4.tar.xz
description :
	 C++ library to parse the file format of CorelDRAW documents
build_deps :
	 cppunit
	 pkg-config
link_deps :
	 boost
	 icu4c
	 librevenge
	 little-cms2
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV["LDFLAGS"] = "-lboost_system-mt"
	 system "./configure", "--disable-werror",
	 "--without-docs",
	 "--prefix=#{prefix}"
	 system "make", "install"
