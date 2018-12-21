name :
	 Pgdbf
homepage :
	 https://github.com/kstrauser/pgdbf
url :
	 https://downloads.sourceforge.net/project/pgdbf/pgdbf/0.6.2/pgdbf-0.6.2.tar.xz
description :
	 Converter of XBase/FoxPro tables to PostgreSQL
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
