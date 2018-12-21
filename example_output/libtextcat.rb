name :
	 Libtextcat
homepage :
	 https://software.wise-guys.nl/libtextcat/
url :
	 https://software.wise-guys.nl/download/libtextcat-2.2.tar.gz
description :
	 N-gram-based text categorization library
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
	 (include/"libtextcat/").install Dir["src/*.h"]
	 share.install "langclass/LM", "langclass/ShortTexts", "langclass/conf.txt"
