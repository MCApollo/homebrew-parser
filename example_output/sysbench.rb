name :
	 Sysbench
homepage :
	 https://github.com/akopytov/sysbench
url :
	 https://github.com/akopytov/sysbench/archive/1.0.16.tar.gz
description :
	 System performance benchmark tool
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 mysql-client
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 system "./configure", "--prefix=#{prefix}", "--with-mysql"
	 system "make", "install"
