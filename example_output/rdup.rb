name :
	 Rdup
homepage :
	 https://github.com/miekg/rdup
url :
	 https://github.com/miekg/rdup/archive/1.1.15.tar.gz
description :
	 Utility to create a file list suitable for making backups
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 glib
	 libarchive
	 mcrypt
	 nettle
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
