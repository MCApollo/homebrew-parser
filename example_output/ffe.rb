name :
	 Ffe
homepage :
	 https://ff-extractor.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ff-extractor/ff-extractor/0.3.8/ffe-0.3.8.tar.gz
description :
	 Parse flat file structures and print them in different formats
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
