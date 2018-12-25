name :
	 Czmq
homepage :
	 http://czmq.zeromq.org/
url :
	 https://github.com/zeromq/czmq/releases/download/v4.1.1/czmq-4.1.1.tar.gz
description :
	 High-level C binding for ZeroMQ
build_deps :
	 asciidoc
	 pkg-config
	 xmlto
link_deps :
	 zeromq
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 args = ["--disable-dependency-tracking", "--prefix=#{prefix}"]
	 args << "--enable-drafts" if build.with? "drafts"
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "ZSYS_INTERFACE=lo0", "check-verbose"
	 system "make", "install"
	 rm Dir["#{bin}/*.gsl"]
