name :
	 Zeromq
homepage :
	 http://www.zeromq.org/
url :
	 https://github.com/zeromq/libzmq/releases/download/v4.2.5/zeromq-4.2.5.tar.gz
description :
	 High-performance, asynchronous messaging library
build_deps :
	 asciidoc
	 pkg-config
	 xmlto
link_deps :
optional_deps :
	 libpgm
	 libsodium
	 norm
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 args = ["--disable-dependency-tracking", "--prefix=#{prefix}"]
	 args << "--with-pgm" if build.with? "libpgm"
	 args << "--with-libsodium" if build.with? "libsodium"
	 args << "--with-norm" if build.with? "norm"
	 args << "--enable-drafts" if build.with?("drafts")
	 ENV["LIBUNWIND_LIBS"] = "-framework System"
	 sdk = MacOS::CLT.installed? ? "" : MacOS.sdk_path
	 ENV["LIBUNWIND_CFLAGS"] = "-I#{sdk}/usr/include"
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "install"
