name :
	 Cocot
homepage :
	 https://vmi.jp/software/cygwin/cocot.html
url :
	 https://github.com/vmi/cocot/archive/cocot-1.2-20171118.tar.gz
description :
	 Code converter on tty
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
