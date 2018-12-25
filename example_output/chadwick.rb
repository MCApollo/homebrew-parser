name :
	 Chadwick
homepage :
	 https://chadwick.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/chadwick/chadwick-0.6/chadwick-0.6.5/chadwick-0.6.5.tar.gz
description :
	 Tools for parsing Retrosheet MLB play-by-play files
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
	 system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
	 system "make"
	 system "make", "install"
