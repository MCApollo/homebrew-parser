name :
	 Libdnet
homepage :
	 https://github.com/dugsong/libdnet
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/libdnet/libdnet-1.12.tgz
description :
	 Portable low-level networking library
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.append_path "ACLOCAL_PATH", "config"
	 system "autoreconf", "-ivf"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-python"
	 system "make", "install"
