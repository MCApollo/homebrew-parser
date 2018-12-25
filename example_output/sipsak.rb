name :
	 Sipsak
homepage :
	 https://sourceforge.net/projects/sipsak.berlios/
url :
	 https://downloads.sourceforge.net/project/sipsak.berlios/sipsak-0.9.6-1.tar.gz
description :
	 SIP Swiss army knife
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
	 ENV.append "CFLAGS", "-std=gnu89"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
