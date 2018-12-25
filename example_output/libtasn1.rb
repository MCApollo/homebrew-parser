name :
	 Libtasn1
homepage :
	 https://www.gnu.org/software/libtasn1/
url :
	 https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.13.tar.gz
description :
	 ASN.1 structure parser library
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
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking",
	 "--disable-silent-rules"
	 system "make", "install"
