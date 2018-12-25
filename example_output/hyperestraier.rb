name :
	 Hyperestraier
homepage :
	 https://fallabs.com/hyperestraier/
url :
	 https://fallabs.com/hyperestraier/hyperestraier-1.4.13.tar.gz
description :
	 Full-text search system for communities
build_deps :
link_deps :
	 qdbm
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--prefix=#{prefix}",
	 "--disable-dependency-tracking"
	 system "make", "mac"
	 system "make", "check-mac"
	 system "make", "install-mac"
