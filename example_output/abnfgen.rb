name :
	 Abnfgen
homepage :
	 http://www.quut.com/abnfgen/
url :
	 http://www.quut.com/abnfgen/abnfgen-0.20.tar.gz
description :
	 Quickly generate random documents that match an ABFN grammar
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
