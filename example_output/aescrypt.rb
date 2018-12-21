name :
	 Aescrypt
homepage :
	 https://aescrypt.sourceforge.io/
url :
	 https://aescrypt.sourceforge.io/aescrypt-0.7.tar.gz
description :
	 Program for encryption/decryption
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure"
	 system "make"
	 bin.install "aescrypt", "aesget"
