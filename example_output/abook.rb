name :
	 Abook
homepage :
	 https://abook.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/abook/abook/0.5.6/abook-0.5.6.tar.gz
description :
	 Address book with mutt support
build_deps :
link_deps :
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
