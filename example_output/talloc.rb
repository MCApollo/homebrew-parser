name :
	 Talloc
homepage :
	 https://talloc.samba.org/
url :
	 https://www.samba.org/ftp/talloc/talloc-2.1.14.tar.gz
description :
	 Hierarchical, reference-counted memory pool with destructors
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
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-rpath",
	 "--without-gettext",
	 "--disable-python"
	 system "make", "install"
