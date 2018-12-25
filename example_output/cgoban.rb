name :
	 Cgoban
homepage :
	 http://www.igoweb.org/~wms/comp/cgoban/index.html
url :
	 http://www.igoweb.org/~wms/comp/cgoban/cgoban-1.9.12.tar.gz
description :
	 Go-related services
build_deps :
link_deps :
	 :x11
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
	 "--disable-silent-rules"
	 bin.mkpath
	 man6.mkpath
	 system "make", "install", "PREFIX=#{prefix}", "MANDIR=#{man}"
