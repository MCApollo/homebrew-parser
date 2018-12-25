name :
	 Kstart
homepage :
	 https://www.eyrie.org/~eagle/software/kstart/
url :
	 https://archives.eyrie.org/software/kerberos/kstart-4.2.tar.gz
description :
	 Modified version of kinit that can use keytabs to authenticate
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
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
