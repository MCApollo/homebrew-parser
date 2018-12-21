name :
	 Podiff
homepage :
	 https://puszcza.gnu.org.ua/software/podiff/
url :
	 https://download.gnu.org.ua/pub/release/podiff/podiff-1.1.tar.gz
description :
	 Compare textual information in two PO files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "podiff"
	 man1.install "podiff.1"
