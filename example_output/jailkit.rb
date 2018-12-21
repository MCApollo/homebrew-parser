name :
	 Jailkit
homepage :
	 https://olivier.sessink.nl/jailkit/
url :
	 https://olivier.sessink.nl/jailkit/jailkit-2.19.tar.bz2
description :
	 Utilities to create limited user accounts in a chroot jail
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
	 system "make", "install"
