name :
	 Dar
homepage :
	 http://dar.linux.free.fr/doc/index.html
url :
	 https://downloads.sourceforge.net/project/dar/dar/2.5.16/dar-2.5.16.tar.gz
description :
	 Backup directory tree and files
build_deps :
	 upx
link_deps :
	 libgcrypt
	 lzo
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-build-html",
	 "--disable-dar-static",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-libxz-linking",
	 "--enable-mode=64"
	 system "make", "install"
