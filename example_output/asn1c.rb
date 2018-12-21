name :
	 Asn1c
homepage :
	 https://lionet.info/asn1c/blog/
url :
	 https://github.com/vlm/asn1c/releases/download/v0.9.28/asn1c-0.9.28.tar.gz
description :
	 Compile ASN.1 specifications into C source code
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-iv" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
