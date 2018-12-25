name :
	 Ktoblzcheck
homepage :
	 https://ktoblzcheck.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ktoblzcheck/ktoblzcheck-1.49.tar.gz
description :
	 Library for German banks
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
