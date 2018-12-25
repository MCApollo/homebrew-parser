name :
	 Libident
homepage :
	 https://www.remlab.net/libident/
url :
	 https://www.remlab.net/files/libident/libident-0.32.tar.gz
description :
	 Ident protocol library
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
