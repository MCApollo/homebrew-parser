name :
	 Libvisio
homepage :
	 https://wiki.documentfoundation.org/DLP/Libraries/libvisio
url :
	 https://dev-www.libreoffice.org/src/libvisio/libvisio-0.1.6.tar.xz
description :
	 Interpret and import Visio diagrams
build_deps :
	 cppunit
	 pkg-config
link_deps :
	 boost
	 icu4c
	 librevenge
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["LDFLAGS"] = "-lboost_system-mt"
	 system "./configure", "--without-docs",
	 "-disable-dependency-tracking",
	 "--enable-static=no",
	 "--prefix=#{prefix}"
	 system "make", "install"
