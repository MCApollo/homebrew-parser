name :
	 Libarchive
homepage :
	 https://www.libarchive.org
url :
	 https://www.libarchive.org/downloads/libarchive-3.3.3.tar.gz
description :
	 Multi-format archive and compression library
build_deps :
link_deps :
	 xz
optional_deps :
	 lz4
	 lzop
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure",
	 "--prefix=#{prefix}",
	 "--without-lzo2",
	 "--without-nettle",
	 "--without-xml2",
	 "--without-openssl",
	 "--with-expat"
	 system "make", "install"
	 ln_s bin/"bsdtar", bin/"tar"
	 ln_s bin/"bsdcpio", bin/"cpio"
	 ln_s man1/"bsdtar.1", man1/"tar.1"
	 ln_s man1/"bsdcpio.1", man1/"cpio.1"
