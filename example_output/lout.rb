name :
	 Lout
homepage :
	 https://savannah.nongnu.org/projects/lout
url :
	 https://download.savannah.gnu.org/releases/lout/lout-3.40.tar.gz
description :
	 Text formatting like TeX, but simpler
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.mkpath
	 man1.mkpath
	 (doc/"lout").mkpath
	 system "make", "PREFIX=#{prefix}", "LOUTLIBDIR=#{lib}", "LOUTDOCDIR=#{doc}", "MANDIR=#{man}", "allinstall"
