name :
	 Libotr
homepage :
	 https://otr.cypherpunks.ca/
url :
	 https://otr.cypherpunks.ca/libotr-4.1.1.tar.gz
description :
	 Off-The-Record (OTR) messaging library
build_deps :
link_deps :
	 libgcrypt
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
