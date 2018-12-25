name :
	 Libtar
homepage :
	 https://repo.or.cz/libtar.git
url :
	 https://repo.or.cz/libtar.git
description :
	 C library for manipulating POSIX tar files
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "--force", "--install"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
