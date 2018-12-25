name :
	 BulkExtractor
homepage :
	 https://github.com/simsong/bulk_extractor/wiki
url :
	 https://digitalcorpora.org/downloads/bulk_extractor/bulk_extractor-1.5.5.tar.gz
description :
	 Stream-based forensics tool
build_deps :
link_deps :
	 boost
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 (pkgshare/"doc").install Dir["doc/*.{html,txt,pdf}"]
	 (lib/"python2.7/site-packages").install Dir["python/*.py"]
