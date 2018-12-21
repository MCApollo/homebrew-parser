name :
	 Omega
homepage :
	 https://xapian.org/
url :
	 https://oligarchy.co.uk/xapian/1.4.3/xapian-omega-1.4.3.tar.xz
description :
	 Packaged search engine for websites, built on top of Xapian
build_deps :
link_deps :
	 libmagic
	 pcre
	 xapian
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
