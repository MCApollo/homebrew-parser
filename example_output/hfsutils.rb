name :
	 Hfsutils
homepage :
	 https://www.mars.org/home/rob/proj/hfs/
url :
	 ftp://ftp.mars.org/pub/hfs/hfsutils-3.2.6.tar.gz
description :
	 Tools for reading and writing Macintosh volumes
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 bin.mkpath
	 man1.mkpath
	 system "make", "install"
