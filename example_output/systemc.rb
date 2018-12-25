name :
	 Systemc
homepage :
	 https://accellera.org/
url :
	 https://www.accellera.org/images/downloads/standards/systemc/systemc-2.3.2.tar.gz
description :
	 Core SystemC language and examples
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--with-arch-suffix=",
	 "--prefix=#{prefix}"
	 system "make", "install"
