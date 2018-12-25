name :
	 Pakchois
homepage :
	 https://web.archive.org/web/www.manyfish.co.uk/pakchois/
url :
	 https://web.archive.org/web/20161220165909/www.manyfish.co.uk/pakchois/pakchois-0.4.tar.gz
description :
	 PKCS #11 wrapper library
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
	 "--prefix=#{prefix}"
	 system "make", "install"
