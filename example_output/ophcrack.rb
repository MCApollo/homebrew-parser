name :
	 Ophcrack
homepage :
	 https://ophcrack.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ophcrack/ophcrack/3.8.0/ophcrack-3.8.0.tar.bz2
description :
	 Microsoft Windows password cracker using rainbow tables
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-gui",
	 "--with-libssl=#{Formula["openssl"].opt_prefix}",
	 "--prefix=#{prefix}"
	 system "make", "install"
