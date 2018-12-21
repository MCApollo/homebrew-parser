name :
	 Xml2
homepage :
	 https://web.archive.org/web/20160730094113/www.ofb.net/~egnor/xml2/
url :
	 https://web.archive.org/web/20160427221603/download.ofb.net/gale/xml2-0.5.tar.gz
description :
	 Makes XML and HTML more amenable to classic UNIX text tools
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
