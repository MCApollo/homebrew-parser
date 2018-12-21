name :
	 Paperkey
homepage :
	 https://www.jabberwocky.com/software/paperkey/
url :
	 https://www.jabberwocky.com/software/paperkey/paperkey-1.5.tar.gz
description :
	 Extract just secret information out of OpenPGP secret keys
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
