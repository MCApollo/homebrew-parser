name :
	 Libmowgli
homepage :
	 https://github.com/atheme/libmowgli-2
url :
	 https://github.com/atheme/libmowgli-2/archive/v2.1.3.tar.gz
description :
	 Core framework for Atheme applications
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make"
	 system "make", "install"
