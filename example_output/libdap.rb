name :
	 Libdap
homepage :
	 https://www.opendap.org/
url :
	 https://www.opendap.org/pub/source/libdap-3.19.1.tar.gz
description :
	 Framework for scientific data networking
build_deps :
	 bison
	 pkg-config
link_deps :
	 libxml2
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11 if MacOS.version < :mavericks
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --disable-debug
	 --with-included-regex
	 ]
	 args << "--with-curl=/usr" if MacOS.version <= :snow_leopard
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "check"
	 system "make", "install"
	 xml2 = Formula["libxml2"]
	 inreplace bin/"dap-config", xml2.opt_prefix.realpath, xml2.opt_prefix
