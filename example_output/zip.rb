name :
	 Zip
homepage :
	 https://infozip.sourceforge.io/Zip.html
url :
	 https://downloads.sourceforge.net/project/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz
description :
	 Compression and file packaging/archive utility
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/z/zip/zip_3.0-11.debian.tar.xz
EOF_patch :
install :
	 system "make", "-f", "unix/Makefile", "CC=#{ENV.cc}", "generic"
	 system "make", "-f", "unix/Makefile", "BINDIR=#{bin}", "MANDIR=#{man1}", "install"
