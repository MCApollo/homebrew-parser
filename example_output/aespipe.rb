name :
	 Aespipe
homepage :
	 https://loop-aes.sourceforge.io/
url :
	 https://loop-aes.sourceforge.io/aespipe/aespipe-v2.4e.tar.bz2
description :
	 AES encryption or decryption for pipes
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
