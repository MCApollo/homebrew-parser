name :
	 Scrypt
homepage :
	 https://www.tarsnap.com/scrypt.html
url :
	 https://www.tarsnap.com/scrypt/scrypt-1.2.1.tgz
description :
	 Encrypt and decrypt files using memory-hard password function
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
