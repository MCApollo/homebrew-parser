name :
	 Gperftools
homepage :
	 https://github.com/gperftools/gperftools
url :
	 https://github.com/gperftools/gperftools/releases/download/gperftools-2.7/gperftools-2.7.tar.gz
description :
	 Multi-threaded malloc() and performance analysis tools
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
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 ENV.append_to_cflags "-D_XOPEN_SOURCE"
	 system "autoreconf", "-fiv" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
