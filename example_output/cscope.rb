name :
	 Cscope
homepage :
	 https://cscope.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/cscope/cscope/15.8b/cscope-15.8b.tar.gz
description :
	 Tool for browsing source code
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
	 "--mandir=#{man}"
	 system "make", "install"
