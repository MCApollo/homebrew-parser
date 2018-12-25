name :
	 Ansifilter
homepage :
	 http://www.andre-simon.de/doku/ansifilter/ansifilter.html
url :
	 http://www.andre-simon.de/zip/ansifilter-2.12.tar.bz2
description :
	 Strip or convert ANSI codes into HTML, (La)Tex, RTF, or BBCode
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
	 system "make", "PREFIX=#{prefix}"
	 system "make", "PREFIX=#{prefix}", "install"
