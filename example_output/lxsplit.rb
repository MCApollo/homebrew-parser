name :
	 Lxsplit
homepage :
	 https://lxsplit.sourceforge.io/
url :
	 https://downloads.sourceforge.net/lxsplit/lxsplit-0.2.4.tar.gz
description :
	 Tool for splitting or joining files
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
	 bin.mkpath
	 inreplace "Makefile", "/usr/local/bin", bin
	 system "make"
	 system "make", "install"
