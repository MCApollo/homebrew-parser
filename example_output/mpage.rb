name :
	 Mpage
homepage :
	 https://mesa.nl/pub/mpage/README
url :
	 https://mesa.nl/pub/mpage/mpage-2.5.7.tgz
description :
	 Many to one page printing utility
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
	 args = %W[
	 MANDIR=#{man1}
	 PREFIX=#{prefix}
	 ]
	 system "make", *args
	 system "make", "install", *args
