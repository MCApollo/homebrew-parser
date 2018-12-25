name :
	 Liblockfile
homepage :
	 https://tracker.debian.org/pkg/liblockfile
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/libl/liblockfile/liblockfile_1.14.orig.tar.gz
description :
	 Library providing functions to lock standard mailboxes
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
	 inreplace "Makefile.in", " -g root ", " "
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-debug",
	 "--with-mailgroup=staff",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--mandir=#{man}"
	 bin.mkpath
	 lib.mkpath
	 include.mkpath
	 man1.mkpath
	 man3.mkpath
	 system "make"
	 system "make", "install"
